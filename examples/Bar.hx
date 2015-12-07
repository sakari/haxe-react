import react.Component;
import react.Dom;
import react.React;
import Sub.sub;

class Bar extends Component<{text : String}>
{
  @state var increment : Int = props.text.length;
  @state var key : Int = 1;
  
  function moreIncrement(e) {
    increment += 1; 
  }

  function newKey(e) {
    key += 1;
  }

  override public function render() {
    return Dom.div({},[
                       sub({ key: key, increment: increment}), 
                       Dom.button({ onClick: moreIncrement }, ["incr+"]),
                       Dom.button({ onClick: newKey }, ["newkey"])
                       ]);
  }
}
