package react;
import react.React.Element;
import react.React.Children;

@:jsRequire("react", "DOM")
extern class Dom {
  static function div(props: Dynamic, ?children: Children): Element;
}
