# React haxe

Little something to do react uis using Haxe

```
class Foo extends Component<text : String, key: String> {

  // members with @state are proxied to the react this.state property
  // using setters and getters so that assigning to the member will 
  // result in the react component state to be updated.
  // The initialiser is called in the constructor so that e.g. `props` 
  // is visible here

  @state var length : Int = props.text.length;
  
  // members with @model are initialised always when new props are given
  // to the component. The `Model` should have `listen` and `unlisten` methods
  // which are called with the components `forceUpdate` method so that changes
  // to the model can trigger a `render`. Unlisten is called when the component
  // unmounts or when new props are received before setting the new Model.

  @model var m : Model = Model.get(props.key);

  // otherwise the haxe component more or less faithfully follows the api of the react
  // component

  function render() {
    return Dom.div({}, ['state ${length}', 'model state ${model.someField}']);
  }
}
```

See `examples/` for details.

## Installing

Using hmm

    hmm haxe-react https://github.com/sakari/haxe-react master

The package uses `require` to require react 0.14 modules so you will
need to provide those. The Makefile contains an example how to do
that.

## usage

Building requires node and haxe. Testing requires Python for running the SimpleHTTPServer.

    make
