package react;
import haxe.extern.EitherType;

extern class Element {}
extern class ReactFactory {}

@:jsRequire("react")
extern class React {
  static public function createFactory<P>(component : Class<Component<P>>): P -> ?Children -> Element;
}

@:jsRequire("react-dom")
extern class ReactDOM {
  static public function render(element : Element, container : js.html.Element): Void;
}

typedef Child = EitherType<Element, String>;
typedef Children = EitherType<Array<Child>, Child>;
