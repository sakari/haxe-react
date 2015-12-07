import react.Component;
import react.Dom;
import react.React;

class Model {
  var listeners : Array<Void -> Void> = [];
  var increment: Int;
  var timer : Int;

  public function new(increment) {
    trace('creating a model');
    this.increment = increment;
    timer = js.Browser.window.setInterval(function() { 
        trace('incrementing state');
        this.state += this.increment; 
        }, 1000);
  }
  public var state(default, set) = 1;
  public function set_state(newState): Int {
    this.state = newState;
    for(l in listeners)
      l();
    return this.state;
  }


  public function listen(cb: Void -> Void): Model {
    trace('listen called');
    this.listeners.push(cb);
    return this;
  }

  public function unlisten(cb: Void -> Void): Model {
    this.listeners.remove(cb);
    trace('listeners after unlisten ${listeners}');
    js.Browser.window.clearInterval(timer);
    return this;
  }
}

class Sub extends Component<{key: Int, increment: Int}>
{
  @model var model : Model = new Model(props.increment);

  public function new(props) {
    trace('component initialising');
    super(props);
    trace('component initialised');
  }

  override public function componentWillUnmount() {
    trace('component unmounting');
    super.componentWillUnmount();
    trace('component unmounted');
  }

  override public function render() {
    return Dom.div({}, [Dom.div({},'state ${model.state} increment ${props.increment}')].concat(children()));
  }
}


