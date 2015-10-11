package react;

import react.React.Element;

@:jsRequire("react", "Component")
extern class NativeComponent<Props> {
  public function new(props : Props);
  public var props: Props;
  public function render(): Element;
  public function componentWillMount(): Void;
}

 @:remove @:autoBuild(react.ComponentBuilderMacro.build())
class Component<Props> extends NativeComponent<Props> {
  public function new(props : Props) {
    super(props);
    untyped this.state = initialState(props);
  }

  public function initialState(props : Props) : {} {
    return {};
  }
}
