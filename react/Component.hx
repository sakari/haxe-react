package react;

import react.React.Element;

@:jsRequire("react", "Component")
extern class NativeComponent<Props> {
  public function new(props : Props);
  public var props: Props;
  public function render(): Element;
  function forceUpdate(): Void;
  function getDOMNode(): js.html.Element;
  function isMounted(): Bool;
  public function componentWillMount(): Void;
  public function componentDidMount(): Void;
  public function componentWillReceiveProps(next : Props): Void;
  public function shouldComponentUpdate(nextProps: Props, nextState: Dynamic): Bool;
  public function componentWillUpdate(nextProps: Props, nextState: Dynamic): Void;
  public function componentDidUpdate(prevProps: Props, prevState: Dynamic): Void;
  public function componentWillUnmount(): Void;
}

 @:remove @:autoBuild(react.ComponentBuilderMacro.build())
class Component<Props> extends NativeComponent<Props> {
  public function new(props : Props) {
    super(props);
    untyped this.state = initialState(props);
  }

  public function children() : Array<React.Element> {
    var cs : Dynamic= untyped this.props.children;
    if(cs == null)
      return [];
    else if(untyped Array.isArray(cs))
      return cs;
    else
      return [cs];
  }

  public function initialState(props : Props) : Dynamic {
    return {};
  }
}
