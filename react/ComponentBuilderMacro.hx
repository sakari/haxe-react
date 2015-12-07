package react;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type.ClassType;
import haxe.ds.Option;

class ComponentBuilderMacro {
  #if macro

  static var reservedIdentifiers = ["state", "setState"];

  static function checkReservedIdentifiers(className) {
    for(f in Context.getBuildFields()) {
      if(reservedIdentifiers.indexOf(f.name) >= 0)
        Context.error('Reserved react identifier `${f.name}` in component class ${className}', f.pos);
    }
  }

  static function getStateType(): Array<haxe.macro.Expr.Field> {
    var stateType = [];
    for(f in getStateMembers()) {
      stateType.push({name: f.field.name, kind: FVar(f.type, null), pos: f.field.pos, doc: null, meta: null});
    }
    return stateType;
  }

  static function getMeta(f, name) {
    if(f.meta == null)
      return None;
    var tags : Array<MetadataEntry> = f.meta.filter(function(meta) { return meta.name == name; });
    if(tags.length > 1)
      Context.error('More than one instance of `${name}` macro', f.pos);
    if(tags.length == 1)
      return Some(tags[0]);
    return None;
  }

  static function isModelField(f) {
    return switch(getMeta(f, "model")) {
      case None: false;
      case Some(_): true;
    }
  }

  static function isStateField(f) {
    return switch(getMeta(f, "state")) {
      case None: false;
      case Some(_): true;
    };
  }

  static function getStateMembers(): Array<{field: Field, expr: Expr, type: Null<ComplexType>}> {
    var members = [];
    for(f in Context.getBuildFields()) {
      if(isStateField(f)) {
        switch(f.kind) {
        case FVar(t, e):
          members.push({field: f, type: t, expr: e});
        default:
        }
      }
    }
    return members;
  }

  static function createGetter(f: Field, t): Field {
    return { name: "get_" + f.name,
        access: [APublic],
        pos: f.pos,
        kind: FFun({
          args: [],
              expr: macro return untyped $p{["this", "state", f.name]},
              params: [],
              ret: t
              })
        };
  }

  static function createSetter(f: Field, t): Field {
    var set = { expr: EObjectDecl([{field: f.name, expr: macro $i{f.name}}]),
                pos: Context.currentPos()
    };

    return { name: "set_" + f.name,
        access: [APublic],
        pos: f.pos,
        kind: FFun({
          args: [{name: f.name, type: t, opt: false, value: null}],
              expr: macro $b{ [ macro untyped this.setState(${set}),
                                macro return $i{f.name}
                                ] },
              params: [],
              ret: t
              })
        };
  }

  static function patchMagicStates(localClass: ClassType, fields: Array<Field>, stateType) {
    for(f in fields) {
      switch(f.kind) {
      case FFun(fun):
        if(["shouldComponentUpdate", "componentWillUpdate", "componentDidUpdate"]
           .indexOf(f.name) >= 0) {
          if(fun.args.length == 2 && fun.args[1].type != null)
            Context.error('Found explicitly given type for state argument in `${f.name}` in component class ${localClass.name}. Please remove it as it will be set automagically based on the class fields.', f.pos);
          fun.args[1].type = TAnonymous(stateType);
        }
      default:
      }
    }
  }

  static function getFieldByName(name, fields:Array<Field>) {
    for(f in fields) {
      if(f.name == name)
        return Some(f);
    }
    return None;
  }
  static function errorIfFieldDefined(name, fields) {
    switch(getFieldByName(name, fields)) {
      case Some(f):
        Context.error('Found `${name}` in component class ${Context.getLocalClass().get().name}. This is an internal method for magic', f.pos);
      default:
    }
  }

  static function fvarInitialiser(field: Field) {
    return switch(field.kind) {
      case FVar(_t, e): 
        if(e == null)
          Context.error('Model field `${field.name}` must have an initialiser in component class ${Context.getLocalClass().get().name}', field.pos);
        e;
      default: 
        Context.error('Model field `${field.name}` must be a var in component class ${Context.getLocalClass().get().name}', field.pos);
        null;
    };
  }

  static function createMagicMethod(name, fields: Array<Field>, expr: Expr, args: Array<FunctionArg>, ret: Null<ComplexType>) {
    errorIfFieldDefined(name, fields);
    fields.push({
      name: name,
      access: [AOverride, APublic],
      pos: Context.getLocalClass().get().pos,
      kind:
        FFun({
          args: args,
          expr: expr,
          ret: null
          })
        });
  }

  static function createModelInitialiser(localClass: haxe.macro.ClassType, fields: Array<Field>) {
    var fieldName = 'initModels';
    var inits = fields.filter(isModelField).map(function(model) {
          return macro $i{model.name} = ${fvarInitialiser(model)};
        });
    var args = [{
      value: null,
      type: null,
      opt: null,
      name: 'props'
    }];
    createMagicMethod(fieldName, fields, (macro $b{inits}), args, null);
  }

  static function createModelUnlistener(localClass: haxe.macro.ClassType, fields: Array<Field>) {
    var fieldName = 'unlistenModels';
    var unlisteners = fields.filter(isModelField).map(function(model) {
        return macro $i{model.name}.unlisten(forceUpdate);
        });
    createMagicMethod(fieldName, fields, (macro $b{unlisteners}), [], null);
  }

  static function createModelListener(localClass: haxe.macro.ClassType, fields: Array<Field>) {
    var fieldName = 'listenModels';
    var listeners= fields.filter(isModelField).map(function(model) {
          return macro $i{model.name}.listen(forceUpdate);
        });
    createMagicMethod(fieldName, fields, (macro $b{listeners}), [], null);
  }

  static function createStateInitialiser(localClass: haxe.macro.ClassType, fields: Array<Field>, stateType) {
    var fieldName = 'initialState';
    var stateFields = getStateMembers();
    var set = { expr: EObjectDecl(stateFields.map(function(f) {return {field: f.field.name, expr: f.expr}})),
                pos: localClass.pos
    };
    createMagicMethod(fieldName, fields, (macro return ${set}), [], TAnonymous(stateType));
  }

  static function removeInitialisers(fields: Array<Field>) {
    for(field in fields) {
      if(isModelField(field) || isStateField(field))
        switch(field.kind) {
          case FVar(t, e): field.kind = FVar(t, null);
          case FProp(get, set, t, e): field.kind = FProp(get, set, t, null);
          default: Context.error('Non var state or model field `${field.name}` in component class `${Context.getLocalClass().get().name}`', field.pos);
        }
    }
  }

  static function addFactoryMethod(className: String, fields: Array<Field>) {
    fields.push(
      { name: "factory",
        access: [AStatic, APublic],
        pos: Context.currentPos() ,
        kind: FVar(null, macro React.createFactory($i{className}))
      });
  }

  public static function build(): Array<Field> {
    var className = Context.getLocalClass().get().name;
    checkReservedIdentifiers(className);

    var stateType = getStateType();

    var fields = Context.getBuildFields();
    for(f in getStateMembers()) {
      getField(f.field.name, fields).kind = FProp("get", "set", f.type);
      fields.push(createGetter(f.field, f.type));
      fields.push(createSetter(f.field, f.type));
    }

    createStateInitialiser(Context.getLocalClass().get(), fields, stateType);
    patchMagicStates(Context.getLocalClass().get(), fields, stateType);
    createModelListener(Context.getLocalClass().get(), fields);
    createModelUnlistener(Context.getLocalClass().get(), fields);
    createModelInitialiser(Context.getLocalClass().get(), fields);
    addFactoryMethod(className, fields);
    removeInitialisers(fields);
    return fields;
  }

  static function getField(name, fields: Array<Field>): Field {
    for(f in fields) {
      if(f.name == name)
        return f;
    }
    return null;
  }
  #end
}
