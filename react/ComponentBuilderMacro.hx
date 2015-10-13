package react;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type.ClassType;

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

  static function getStateMembers(): Array<{field: Field, type: Null<ComplexType>}> {
    var members = [];
    for(f in Context.getBuildFields()) {
      if(f.access.indexOf(AStatic) < 0) {
        switch(f.kind) {
        case FVar(t, _):
          members.push({field: f, type: t});
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

  static function patchInitializer(localClass: haxe.macro.ClassType, fields: Array<Field>, stateType) {
    var className = localClass.name;
    var getInitializer;
    for(f in fields) {
      if(f.name == "initialState") {
        switch(f.kind) {
        case FFun(fun):
          if(fun.ret != null)
            Context.error('Found explicitly given type for `initialState` in component class ${className}. Please remove it as it will be set automagically based on the class fields.', f.pos);
          fun.ret = TAnonymous(stateType);
          getInitializer = f;
        default:
        }
      }
    }
    if(getInitializer == null && stateType.length > 0)
      Context.error('Missing `initialState` for stateful component class ${className}',
                    localClass.pos);
    if(getInitializer != null && stateType.length == 0)
      Context.error('Unneeded `initialState` for stateless component class ${className}', getInitializer.pos);
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

    patchInitializer(Context.getLocalClass().get(), fields, stateType);
    patchMagicStates(Context.getLocalClass().get(), fields, stateType);
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
