package;
import react.Component;
import react.Dom;
import react.React;

class Sub extends Component<{key: Int, count: Int}>
{
  private function new(props) {
    super(props);
  }

  override public function render() {
    return Dom.div({}, [Std.string(this.props.count)]);
  }
}


class Bar extends Component<{text : String}>
{
  private function new(props) {
    super(props);
  }
  var count : Int;
  static var sub = React.createFactory(Sub);

  override public function initialState(props) {
    return { count: props.text.length };
  }

  override public function shouldComponentUpdate(nextProps, nextState) {
    return (nextProps.text == "aa" && nextState.count == 1);
  }

  override public function render() {
    return Dom.div({},[
                       sub({ key: 1, count: 10}),
                       sub({ key: 2, count: this.count })
                       ]);
  }
}