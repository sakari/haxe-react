package react;
import haxe.macro.Expr;
import haxe.macro.Context;

class ComponentBuilderMacro {
  #if macro
  public static function build(): Array<Field> {
    var fields = Context.getBuildFields();
    var accessors = [];
    var stateType = [];
    for(f in fields) {
      if(f.access.indexOf(AStatic) < 0) {
          switch(f.kind) {
          case FVar(t,_):
            stateType.push({name: f.name, kind: FVar(t, null), pos: Context.currentPos()});
            f.kind = FProp("get", "set", t);
            accessors.push({
              name: "get_" + f.name,
                  access: [APublic],
                  pos: Context.currentPos(),
                  kind: FFun({
                    args: [],
                        expr: macro return $p{["this", "state", f.name]},
                        params: [],
                        ret: t
                        })
                  });
            var set = { expr: EObjectDecl([{field: f.name, expr: macro $i{f.name}}]),
                        pos: Context.currentPos()
            };
            accessors.push({
              name: "set_" + f.name,
                  access: [APublic],
                  pos: Context.currentPos(),
                  kind: FFun({
                    args: [{name: f.name, type: t, opt: false, value: null}],
                        expr: macro $b{ [ macro this.setState(${set}),
                                          macro return $i{f.name}
                                          ] },
                        params: [],
                        ret: t
                        })
                  });
          default:
          }
        }
    }
    for(accessor in accessors) {
      fields.push(accessor);
    }
    var getInitializer;
    for(f in fields) {
      if(f.name == "initialState") {
        switch(f.kind) {
        case FFun(fun):
          if(fun.ret != null)
            Context.error('Found explicitly given type for initialState in component class ${Context.getLocalClass().get().name}. Please remove it as it will be set automagically based on the class fields.', f.pos);
          fun.ret = TAnonymous(stateType);
          getInitializer = f;
        default:
        }
      }
    }
    if(getInitializer == null && stateType.length > 0)
      Context.error('Missing initialState for stateful component class ${Context.getLocalClass().get().name}',
                    Context.getLocalClass().get().pos);
    if(getInitializer != null && stateType.length == 0)
      Context.error('Unneeded initialState for stateless component class ${Context.getLocalClass().get().name}', getInitializer.pos);
    return fields;
  }
  #end
}
