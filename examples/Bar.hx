import react.Component;
import react.Dom;
import react.React;

class Sub extends Component<{key: Int, count: Int}>
{
  private function new(props) {
    super(props);
  }

  override public function render() {
    return Dom.div({}, children());
  }
}


class Bar extends Component<{text : String}>
{
  private function new(props) {
    super(props);
  }
  var count : Int;

  override public function initialState(props) {
    return { count: props.text.length };
  }

  override public function shouldComponentUpdate(nextProps, nextState) {
    return (nextProps.text == "aa" && nextState.count == 1);
  }

  override public function render() {
    return Dom.div({},[
                       Sub.factory({ key: 1, count: 10}, [Dom.div({}, "aa")]),
                       Sub.factory({ key: 2, count: this.count })
                       ]);
  }
}
