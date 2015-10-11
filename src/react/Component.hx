package react;

import react.React.Element;

@:jsRequire("react", "Component")
extern class NativeComponent<Props> {
  public function new(props : Props);
  public var props: Props;
  var state: Dynamic;
  public function render(): Element;
  public function componentWillMount(): Void;
  function setState(stateFragment: Dynamic): Void;
}

 @:remove @:autoBuild(react.ComponentBuilderMacro.build())
class Component<Props> extends NativeComponent<Props> {
  public function new(props : Props) {
    super(props);
    this.state = initialState(props);
  }

  public function initialState(props : Props) : {} {
    return {};
  }
}
