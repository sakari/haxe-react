package react;
import react.React.Element;
import react.React.Children;
import js.html.Event;

typedef SyntheticEvent = {
 bubbles: Bool,
 cancelable: Bool,
 currentTarget: js.html.Element,
 defaultPrevented: Bool,
 eventPhase: Int,
 isTrusted: Bool,
 nativeEvent: js.html.Event,
 preventDefault: Void -> Void,
 isDefaultPrevented: Void -> Bool,
 stopPropagation: Void -> Void,
 isPropagationStopped: Void -> Bool,
 target: js.html.Element,
 timeStamp: Int,
 type: String,
 persist: Void -> Void
};

typedef ClipboardEvent = {> SyntheticEvent,
                          clipboardData: js.html.DataTransfer
};

typedef CompositionEvent = {> SyntheticEvent,
                            data: String
};

typedef KeyboardEvent = {> SyntheticEvent,
                         altKey: Bool,
                         charCode: Int,
                         ctrlKey: Bool,
                         getModifierState: Int -> Bool,
                         key: String,
                         keyCode: Int,
                         locale: String,
                         location: Int,
                         metaKey: Bool,
                         repeat: Bool,
                         shiftKey: Bool,
                         which: Int
};

typedef FocusEvent = {> SyntheticEvent,
                      relatedTarget : js.html.Element
};

typedef MouseEvent = {> SyntheticEvent,
                      altKey: Bool,
                      button: Int,
                      buttons: Int,
                      clientX: Float,
                      clientY: Float,
                      ctrlKey: Bool,
                      getModifierState: Int -> Bool,
                      metaKey: Bool,
                      pageX: Float,
                      pageY: Float,
                      relatedTarget: js.html.Element,
                      screenX: Float,
                      screenY: Float,
                      shiftKey: Bool
};

typedef TouchEvent = {>SyntheticEvent,
                      altKey: Bool,
                      changedTouches: js.html.TouchList,
                      ctrlKey: Bool,
                      getModifierState: Int -> Bool,
                      metaKey: Bool,
                      shiftKey: Bool,
                      targetTouches: js.html.TouchList,
                      touches: js.html.TouchList
};

typedef UIEvent = {> SyntheticEvent,
                   detail: Int,
                   view: Dynamic
};

typedef WheelEvent = {> SyntheticEvent,
                      deltaMode: Int,
                      deltaX: Float,
                      deltaY: Float,
                      deltaZ: Float,
};

typedef EventAttr = { ?onCopy : ClipboardEvent -> Void,
                      ?onCut : ClipboardEvent -> Void,
                      ?onPast : ClipboardEvent -> Void,

                      ?onCompositionEnd : CompositionEvent -> Void,
                      ?onCompositionStart : CompositionEvent -> Void,
                      ?onCompositionUpdate : CompositionEvent -> Void,

                      ?onKeyDown : KeyboardEvent -> Void,
                      ?onKeyPress : KeyboardEvent -> Void,
                      ?onKeyUp : KeyboardEvent -> Void,

                      ?onFocus : FocusEvent -> Void,
                      ?onBlur : FocusEvent -> Void,

                      ?onChange : SyntheticEvent -> Void,
                      ?onInput : SyntheticEvent -> Void,
                      ?onSubmit : SyntheticEvent -> Void,

                      ?onClick : MouseEvent -> Void,
                      ?onContextMenu : MouseEvent -> Void,
                      ?onDoubleClick : MouseEvent -> Void,
                      ?onDrag : MouseEvent -> Void,
                      ?onDragEnd : MouseEvent -> Void,
                      ?onDragEnter : MouseEvent -> Void,
                      ?onDragExit : MouseEvent -> Void,
                      ?onDragLeave : MouseEvent -> Void,
                      ?onDragOver : MouseEvent -> Void,
                      ?onDragStart : MouseEvent -> Void,
                      ?onDrop : MouseEvent -> Void,
                      ?onMouseDown : MouseEvent -> Void,
                      ?onMouseEnter : MouseEvent -> Void,
                      ?onMouseLeave : MouseEvent -> Void,
                      ?onMouseMove : MouseEvent -> Void,
                      ?onMouseOut : MouseEvent -> Void,
                      ?onMouseOver : MouseEvent -> Void,
                      ?onMouseUp : MouseEvent -> Void,

                      ?onSelect : SyntheticEvent -> Void,

                      ?onTouchCancel : TouchEvent -> Void,
                      ?onTouchEnd : TouchEvent -> Void,
                      ?onTouchMove : TouchEvent -> Void,
                      ?onTouchStart : TouchEvent -> Void,

                      ?onScroll : UIEvent -> Void,

                      ?onWheel : WheelEvent -> Void,

                      ?onAbort : SyntheticEvent -> Void,
                      ?onCanPlay : SyntheticEvent -> Void,
                      ?onCanPlayThrough : SyntheticEvent -> Void,
                      ?onDurationChange : SyntheticEvent -> Void,
                      ?onEmptied : SyntheticEvent -> Void,
                      ?onEncrypted : SyntheticEvent -> Void,
                      ?onEnded : SyntheticEvent -> Void,
                      ?onError : SyntheticEvent -> Void,
                      ?onLoadedData : SyntheticEvent -> Void,
                      ?onLoadedMetadata : SyntheticEvent -> Void,
                      ?onLoadStart : SyntheticEvent -> Void,
                      ?onPause : SyntheticEvent -> Void,
                      ?onPlay : SyntheticEvent -> Void,
                      ?onPlaying : SyntheticEvent -> Void,
                      ?onProgress : SyntheticEvent -> Void,
                      ?onRateChange : SyntheticEvent -> Void,
                      ?onSeeked : SyntheticEvent -> Void,
                      ?onSeeking : SyntheticEvent -> Void,
                      ?onStalled : SyntheticEvent -> Void,
                      ?onSuspend : SyntheticEvent -> Void,
                      ?onTimeUpdate : SyntheticEvent -> Void,
                      ?onVolumeChange : SyntheticEvent -> Void,
                      ?onWaiting : SyntheticEvent -> Void,

                      ?onLoad : SyntheticEvent -> Void,
                      //onError : SyntheticEvent -> Void
};


typedef HtmlAttr = {
 ?accept: Dynamic, ?acceptCharset: Dynamic, ?accessKey: Dynamic, ?action:
 Dynamic, ?allowFullScreen: Dynamic, ?allowTransparency: Dynamic, ?alt:
 Dynamic, ?async: Dynamic, ?autoComplete: Dynamic, ?autoFocus: Dynamic,
 ?autoPlay: Dynamic, ?capture: Dynamic, ?cellPadding: Dynamic,
 ?cellSpacing: Dynamic, ?charSet: Dynamic, ?challenge: Dynamic, ?checked:
 Dynamic, ?classID: Dynamic, ?className: Dynamic, ?cols: Dynamic,
 ?colSpan: Dynamic, ?content: Dynamic, ?contentEditable: Dynamic,
 ?contextMenu: Dynamic, ?controls: Dynamic, ?coords: Dynamic,
 ?crossOrigin: Dynamic, ?data: Dynamic, ?dateTime: Dynamic, ?defer:
 Dynamic, ?dir: Dynamic, ?disabled: Dynamic, ?download: Dynamic,
 ?draggable: Dynamic, ?encType: Dynamic, ?form: Dynamic, ?formAction:
 Dynamic, ?formEncType: Dynamic, ?formMethod: Dynamic, ?formNoValidate:
 Dynamic, ?formTarget: Dynamic, ?frameBorder: Dynamic, ?headers: Dynamic,
 ?height: Dynamic, ?hidden: Dynamic, ?high: Dynamic, ?href: Dynamic,
 ?hrefLang: Dynamic, ?htmlFor: Dynamic, ?httpEquiv: Dynamic, ?icon:
 Dynamic, ?id: Dynamic, ?inputMode: Dynamic, ?keyParams: Dynamic,
 ?keyType: Dynamic, ?label: Dynamic, ?lang: Dynamic, ?list: Dynamic, ?loop:
 Dynamic, ?low: Dynamic, ?manifest: Dynamic, ?marginHeight: Dynamic,
 ?marginWidth: Dynamic, ?max: Dynamic, ?maxLength: Dynamic, ?media:
 Dynamic, ?mediaGroup: Dynamic, ?method: Dynamic, ?min: Dynamic,
 ?minlength: Dynamic, ?multiple: Dynamic, ?muted: Dynamic, ?name: Dynamic,
 ?noValidate: Dynamic, ?open: Dynamic, ?optimum: Dynamic, ?pattern:
 Dynamic, ?placeholder: Dynamic, ?poster: Dynamic, ?preload: Dynamic,
 ?radioGroup: Dynamic, ?readOnly: Dynamic, ?rel: Dynamic, ?required:
 Dynamic, ?role: Dynamic, ?rows: Dynamic, ?rowSpan: Dynamic, ?sandbox:
 Dynamic, ?scope: Dynamic, ?scoped: Dynamic, ?scrolling: Dynamic,
 ?seamless: Dynamic, ?selected: Dynamic, ?shape: Dynamic, ?size: Dynamic,
 ?sizes: Dynamic, ?span: Dynamic, ?spellCheck: Dynamic, ?src: Dynamic,
 ?srcDoc: Dynamic, ?srcSet: Dynamic, ?start: Dynamic, ?step: Dynamic,
 ?style: Dynamic, ?summary: Dynamic, ?tabIndex: Dynamic, ?target: Dynamic,
 ?title: Dynamic, ?type: Dynamic, ?useMap: Dynamic, ?value: Dynamic,
 ?width: Dynamic, ?wmode: Dynamic, ?wrap: Dynamic
};

typedef ReactHtmlAttr = {> HtmlAttr, > EventAttr, ?autoCapitalize: Dynamic,
?autoCorrect: Dynamic, ?property: Dynamic, ?itemProp: Dynamic, ?itemScope:
Dynamic, ?itemType: Dynamic, ?itemID: Dynamic, ?unselectable: Dynamic,
?results: Dynamic, ?autosave: Dynamic, ?key: Dynamic,
?dangerouslySetInnerHTML: Dynamic };


typedef SvgAttr = {
 ?clipPath: Dynamic, ?cx: Dynamic, ?cy: Dynamic, ?d: Dynamic, ?dx: Dynamic,
 ?dy: Dynamic, ?fill: Dynamic, ?fillOpacity: Dynamic, ?fontFamily:
 Dynamic, ?fontSize: Dynamic, ?fx: Dynamic, ?fy: Dynamic,
 ?gradientTransform: Dynamic, ?gradientUnits: Dynamic, ?markerEnd:
 Dynamic, ?markerMid: Dynamic, ?markerStart: Dynamic, ?offset: Dynamic,
 ?opacity: Dynamic, ?patternContentUnits: Dynamic, ?patternUnits:
 Dynamic, ?points: Dynamic, ?preserveAspectRatio: Dynamic, ?r: Dynamic,
 ?rx: Dynamic, ?ry: Dynamic, ?spreadMethod: Dynamic, ?stopColor: Dynamic,
 ?stopOpacity: Dynamic, ?stroke: Dynamic, ?strokeDasharray: Dynamic,
 ?strokeLinecap: Dynamic, ?strokeOpacity: Dynamic, ?strokeWidth: Dynamic,
 ?textAnchor: Dynamic, ?transform: Dynamic, ?version: Dynamic, ?viewBox:
 Dynamic, ?x1: Dynamic, ?x2: Dynamic, ?x: Dynamic, ?xlinkActuate: Dynamic,
 ?xlinkArcrole: Dynamic, ?xlinkHref: Dynamic, ?xlinkRole: Dynamic,
 ?xlinkShow: Dynamic, ?xlinkTitle: Dynamic, ?xlinkType: Dynamic, ?xmlBase:
 Dynamic, ?xmlLang: Dynamic, ?xmlSpace: Dynamic, ?y1: Dynamic, ?y2:
 Dynamic, ?y: Dynamic
};

typedef ReactSvgAttr = { > SvgAttr, ?key: Dynamic };

@:jsRequire("react", "DOM")
extern class Dom {
  //svg elements
  static function circle(props: ReactSvgAttr, ?children: Children): Element;
  static function clipPath(props: ReactSvgAttr, ?children: Children): Element;
  static function defs(props: ReactSvgAttr, ?children: Children): Element;
  static function ellipse(props: ReactSvgAttr, ?children: Children): Element;
  static function g(props: ReactSvgAttr, ?children: Children): Element;
  static function line(props: ReactSvgAttr, ?children: Children): Element;
  static function linearGradient(props: ReactSvgAttr, ?children: Children): Element;
  static function mask(props: ReactSvgAttr, ?children: Children): Element;
  static function path(props: ReactSvgAttr, ?children: Children): Element;
  static function pattern(props: ReactSvgAttr, ?children: Children): Element;
  static function polygon(props: ReactSvgAttr, ?children: Children): Element;
  static function polyline(props: ReactSvgAttr, ?children: Children): Element;

  static function radialGradient(props: ReactSvgAttr, ?children: Children): Element;
  static function rect(props: ReactSvgAttr, ?children: Children): Element;
  static function stop(props: ReactSvgAttr, ?children: Children): Element;
  static function svg(props: ReactSvgAttr, ?children: Children): Element;
  static function text(props: ReactSvgAttr, ?children: Children): Element;
  static function tspan(props: ReactSvgAttr, ?children: Children): Element;

  //html elements
  static function a(props: ReactHtmlAttr, ?children: Children): Element;
  static function abbr(props: ReactHtmlAttr, ?children: Children): Element;
  static function address(props: ReactHtmlAttr, ?children: Children): Element;
  static function area(props: ReactHtmlAttr, ?children: Children): Element;
  static function article(props: ReactHtmlAttr, ?children: Children): Element;
  static function aside(props: ReactHtmlAttr, ?children: Children): Element;
  static function audio(props: ReactHtmlAttr, ?children: Children): Element;
  static function b(props: ReactHtmlAttr, ?children: Children): Element;
  static function base(props: ReactHtmlAttr, ?children: Children): Element;
  static function bdi(props: ReactHtmlAttr, ?children: Children): Element;
  static function bdo(props: ReactHtmlAttr, ?children: Children): Element;
  static function big(props: ReactHtmlAttr, ?children: Children): Element;
  static function blockquote(props: ReactHtmlAttr, ?children: Children): Element;
  static function body(props: ReactHtmlAttr, ?children: Children): Element;
  static function br(props: ReactHtmlAttr, ?children: Children): Element;
  static function button(props: ReactHtmlAttr, ?children: Children): Element;
  static function canvas(props: ReactHtmlAttr, ?children: Children): Element;
  static function caption(props: ReactHtmlAttr, ?children: Children): Element;
  static function cite(props: ReactHtmlAttr, ?children: Children): Element;
  static function code(props: ReactHtmlAttr, ?children: Children): Element;
  static function col(props: ReactHtmlAttr, ?children: Children): Element;
  static function colgroup(props: ReactHtmlAttr, ?children: Children): Element;
  static function data(props: ReactHtmlAttr, ?children: Children): Element;
  static function datalist(props: ReactHtmlAttr, ?children: Children): Element;
  static function dd(props: ReactHtmlAttr, ?children: Children): Element;
  static function del(props: ReactHtmlAttr, ?children: Children): Element;
  static function details(props: ReactHtmlAttr, ?children: Children): Element;
  static function dfn(props: ReactHtmlAttr, ?children: Children): Element;
  static function dialog(props: ReactHtmlAttr, ?children: Children): Element;
  static function div(props: ReactHtmlAttr, ?children: Children): Element;
  static function dl(props: ReactHtmlAttr, ?children: Children): Element;
  static function dt(props: ReactHtmlAttr, ?children: Children): Element;
  static function em(props: ReactHtmlAttr, ?children: Children): Element;
  static function embed(props: ReactHtmlAttr, ?children: Children): Element;
  static function fieldset(props: ReactHtmlAttr, ?children: Children): Element;
  static function figcaption(props: ReactHtmlAttr, ?children: Children): Element;
  static function figure(props: ReactHtmlAttr, ?children: Children): Element;
  static function footer(props: ReactHtmlAttr, ?children: Children): Element;
  static function form(props: ReactHtmlAttr, ?children: Children): Element;
  static function h1(props: ReactHtmlAttr, ?children: Children): Element;
  static function h2(props: ReactHtmlAttr, ?children: Children): Element;
  static function h3(props: ReactHtmlAttr, ?children: Children): Element;
  static function h4(props: ReactHtmlAttr, ?children: Children): Element;
  static function h5(props: ReactHtmlAttr, ?children: Children): Element;
  static function h6(props: ReactHtmlAttr, ?children: Children): Element;
  static function head(props: ReactHtmlAttr, ?children: Children): Element;
  static function header(props: ReactHtmlAttr, ?children: Children): Element;
  static function hr(props: ReactHtmlAttr, ?children: Children): Element;
  static function html(props: ReactHtmlAttr, ?children: Children): Element;
  static function i(props: ReactHtmlAttr, ?children: Children): Element;
  static function iframe(props: ReactHtmlAttr, ?children: Children): Element;
  static function img(props: ReactHtmlAttr, ?children: Children): Element;
  static function input(props: ReactHtmlAttr, ?children: Children): Element;
  static function ins(props: ReactHtmlAttr, ?children: Children): Element;
  static function kbd(props: ReactHtmlAttr, ?children: Children): Element;
  static function keygen(props: ReactHtmlAttr, ?children: Children): Element;
  static function label(props: ReactHtmlAttr, ?children: Children): Element;
  static function legend(props: ReactHtmlAttr, ?children: Children): Element;
  static function li(props: ReactHtmlAttr, ?children: Children): Element;
  static function link(props: ReactHtmlAttr, ?children: Children): Element;
  static function main(props: ReactHtmlAttr, ?children: Children): Element;
  static function map(props: ReactHtmlAttr, ?children: Children): Element;
  static function mark(props: ReactHtmlAttr, ?children: Children): Element;
  static function menu(props: ReactHtmlAttr, ?children: Children): Element;
  static function menuitem(props: ReactHtmlAttr, ?children: Children): Element;
  static function meta(props: ReactHtmlAttr, ?children: Children): Element;
  static function meter(props: ReactHtmlAttr, ?children: Children): Element;
  static function nav(props: ReactHtmlAttr, ?children: Children): Element;
  static function noscript(props: ReactHtmlAttr, ?children: Children): Element;
  static function object(props: ReactHtmlAttr, ?children: Children): Element;
  static function ol(props: ReactHtmlAttr, ?children: Children): Element;
  static function optgroup(props: ReactHtmlAttr, ?children: Children): Element;
  static function option(props: ReactHtmlAttr, ?children: Children): Element;
  static function output(props: ReactHtmlAttr, ?children: Children): Element;
  static function p(props: ReactHtmlAttr, ?children: Children): Element;
  static function param(props: ReactHtmlAttr, ?children: Children): Element;
  static function picture(props: ReactHtmlAttr, ?children: Children): Element;
  static function pre(props: ReactHtmlAttr, ?children: Children): Element;
  static function progress(props: ReactHtmlAttr, ?children: Children): Element;
  static function q(props: ReactHtmlAttr, ?children: Children): Element;
  static function rp(props: ReactHtmlAttr, ?children: Children): Element;
  static function rt(props: ReactHtmlAttr, ?children: Children): Element;
  static function ruby(props: ReactHtmlAttr, ?children: Children): Element;
  static function s(props: ReactHtmlAttr, ?children: Children): Element;
  static function samp(props: ReactHtmlAttr, ?children: Children): Element;
  static function script(props: ReactHtmlAttr, ?children: Children): Element;
  static function section(props: ReactHtmlAttr, ?children: Children): Element;
  static function select(props: ReactHtmlAttr, ?children: Children): Element;
  static function small(props: ReactHtmlAttr, ?children: Children): Element;
  static function source(props: ReactHtmlAttr, ?children: Children): Element;
  static function span(props: ReactHtmlAttr, ?children: Children): Element;
  static function strong(props: ReactHtmlAttr, ?children: Children): Element;
  static function style(props: ReactHtmlAttr, ?children: Children): Element;
  static function sub(props: ReactHtmlAttr, ?children: Children): Element;
  static function summary(props: ReactHtmlAttr, ?children: Children): Element;
  static function sup(props: ReactHtmlAttr, ?children: Children): Element;
  static function table(props: ReactHtmlAttr, ?children: Children): Element;
  static function tbody(props: ReactHtmlAttr, ?children: Children): Element;
  static function td(props: ReactHtmlAttr, ?children: Children): Element;
  static function textarea(props: ReactHtmlAttr, ?children: Children): Element;
  static function tfoot(props: ReactHtmlAttr, ?children: Children): Element;
  static function th(props: ReactHtmlAttr, ?children: Children): Element;
  static function thead(props: ReactHtmlAttr, ?children: Children): Element;
  static function time(props: ReactHtmlAttr, ?children: Children): Element;
  static function title(props: ReactHtmlAttr, ?children: Children): Element;
  static function tr(props: ReactHtmlAttr, ?children: Children): Element;
  static function track(props: ReactHtmlAttr, ?children: Children): Element;
  static function u(props: ReactHtmlAttr, ?children: Children): Element;
  static function ul(props: ReactHtmlAttr, ?children: Children): Element;
  //static function var(props: ReactHtmlAttr, ?children: Children): Element;
  static function video(props: ReactHtmlAttr, ?children: Children): Element;
  static function wbr(props: ReactHtmlAttr, ?children: Children): Element;
}
