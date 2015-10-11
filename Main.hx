import js.Lib;
import js.Browser;
import Bar;
import react.React;

class Main {
  static function main() {
    var container = Browser.document.getElementById("react-container");
    ReactDOM.render(React.createFactory(Bar)({text: "text"}), container);
  }
}