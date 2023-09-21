module RenderXml.Html.Indexed where

import RenderXml.Html.Indexed.AutocompleteType (AutocompleteType)
import RenderXml.Html.Indexed.ButtonType (ButtonType)
import RenderXml.Html.Indexed.CrossOriginValue (CrossOriginValue)
import RenderXml.Html.Indexed.DirValue (DirValue)
import RenderXml.Html.Indexed.FormMethod (FormMethod)
import RenderXml.Html.Indexed.InputAcceptType (InputAcceptType)
import RenderXml.Html.Indexed.InputType (InputType)
import RenderXml.Html.Indexed.KindValue (KindValue)
import RenderXml.Html.Indexed.MenuType (MenuType)
import RenderXml.Html.Indexed.MenuitemType (MenuitemType)
import RenderXml.Html.Indexed.OrderedListType (OrderedListType)
import RenderXml.Html.Indexed.PreloadValue (PreloadValue)
import RenderXml.Html.Indexed.ScopeValue (ScopeValue)
import RenderXml.Html.Indexed.StepValue (StepValue)
import RenderXml.Html.Indexed.WrapValue (WrapValue)
import Data.DateTime (DateTime)
import Data.MediaType (MediaType)

type CSSPixel = Int

type GlobalAttributes r =
  ( id :: String
  , title :: String
  , class :: String
  , style :: String
  , spellcheck :: Boolean
  , draggable :: Boolean
  , lang :: String
  , dir :: DirValue
  , hidden :: Boolean
  , tabIndex :: Int
  , accessKey :: String
  , contentEditable :: Boolean
  | r
  )

-- type GlobalEvents r =
-- ( onContextMenu :: Event
-- , onInput :: Event
-- | r
-- )

-- type MouseEvents r =
-- ( onDoubleClick :: MouseEvent
-- , onClick :: MouseEvent
-- , onAuxClick :: MouseEvent
-- , onMouseDown :: MouseEvent
-- , onMouseEnter :: MouseEvent
-- , onMouseLeave :: MouseEvent
-- , onMouseMove :: MouseEvent
-- , onMouseOver :: MouseEvent
-- , onMouseOut :: MouseEvent
-- , onMouseUp :: MouseEvent
-- | r
-- )

-- type DragEvents r =
-- ( onDrag :: DragEvent
-- , onDragEnd :: DragEvent
-- , onDragExit :: DragEvent
-- , onDragEnter :: DragEvent
-- , onDragLeave :: DragEvent
-- , onDragOver :: DragEvent
-- , onDragStart :: DragEvent
-- , onDrop :: DragEvent
-- | r
-- )

-- type TouchEvents r =
-- ( onTouchCancel :: TouchEvent
-- , onTouchEnd :: TouchEvent
-- , onTouchEnter :: TouchEvent
-- , onTouchLeave :: TouchEvent
-- , onTouchMove :: TouchEvent
-- , onTouchStart :: TouchEvent
-- | r
-- )

-- type PointerEvents r =
-- ( onPointerOver :: PointerEvent
-- , onPointerEnter :: PointerEvent
-- , onPointerDown :: PointerEvent
-- , onPointerMove :: PointerEvent
-- , onPointerUp :: PointerEvent
-- , onPointerCancel :: PointerEvent
-- , onPointerOut :: PointerEvent
-- , onPointerLeave :: PointerEvent
-- , onGotPointerCapture :: PointerEvent
-- , onLostPointerCapture :: PointerEvent
-- | r
-- )

-- type KeyEvents r =
-- ( onKeyDown :: KeyboardEvent
-- , onKeyUp :: KeyboardEvent
-- , onKeyPress :: KeyboardEvent
-- | r
-- )

-- type TransitionEvents r =
-- ( onTransitionEnd :: Event
-- | r
-- )

-- type FocusEvents r =
-- ( onBlur :: FocusEvent
-- , onFocus :: FocusEvent
-- , onFocusIn :: FocusEvent
-- , onFocusOut :: FocusEvent
-- | r
-- )

-- type ClipboardEvents r =
-- ( onCopy :: ClipboardEvent
-- , onCut :: ClipboardEvent
-- , onPaste :: ClipboardEvent
-- | r
-- )
type InteractiveEvents :: Row Type -> Row Type
type InteractiveEvents r = r -- ClipboardEvents (FocusEvents (TransitionEvents (KeyEvents (PointerEvents (TouchEvents (DragEvents (MouseEvents ( {- onWheel :: WheelEvent | -} r))))))))

type GlobalProperties r = GlobalAttributes r -- (GlobalEvents r)

type Interactive r = InteractiveEvents (GlobalProperties r)

type Noninteractive r = GlobalProperties r

type HTMLa = Interactive
  ( download :: String
  , href :: String
  , hrefLang :: String
  , rel :: String
  , target :: String
  , type :: MediaType
  )

type HTMLabbr = Interactive ()

type HTMLaddress = Interactive () -- (onScroll :: Event)

type HTMLarea = Interactive
  ( coords :: String
  , download :: String
  , href :: String
  , hrefLang :: String
  , media :: String
  , rel :: String
  , shape :: String
  , target :: String
  , type :: MediaType
  )

type HTMLarticle = Interactive ()

type HTMLaside = Interactive ()

type HTMLaudio = Interactive
  ( autoplay :: Boolean
  , controls :: Boolean
  , loop :: Boolean
  , muted :: Boolean
  , preload :: PreloadValue
  , src :: String
  -- , onError :: Event
  )

type HTMLb = Interactive ()

type HTMLbase = Noninteractive
  ( href :: String
  , target :: String
  )

type HTMLbdi = Interactive ()

type HTMLbdo = Noninteractive ()

type HTMLblockquote = Interactive
  ( cite :: String
  -- , onScroll :: Event
  )

type HTMLbody = Interactive ()
-- ( onBeforeUnload :: Event
-- , onHashChange :: Event
-- , onLoad :: Event
-- , onPageShow :: Event
-- , onPageHide :: Event
-- , onResize :: Event
-- , onScroll :: Event
-- , onUnload :: Event
-- )

type HTMLbr = Noninteractive ()

type HTMLbutton = Interactive
  ( autofocus :: Boolean
  , disabled :: Boolean
  , form :: String
  , formAction :: String
  , formEncType :: MediaType
  , formMethod :: FormMethod
  , formNoValidate :: Boolean
  , formTarget :: String
  , name :: String
  , type :: ButtonType
  , value :: String
  )

type HTMLcanvas = Interactive
  ( width :: CSSPixel
  , height :: CSSPixel
  )

type HTMLcaption = Interactive () -- (onScroll :: Event)

type HTMLcite = Interactive ()

type HTMLcode = Interactive ()

type HTMLcol = Interactive ()

type HTMLcolgroup = Interactive (span :: Int)

type HTMLcommand = Interactive ()

type HTMLdatalist = Interactive ()

type HTMLdd = Interactive () -- (onScroll :: Event)

type HTMLdel = Interactive
  ( cite :: String
  , datetime :: String
  )

type HTMLdetails = Interactive (open :: Boolean)

type HTMLdfn = Interactive ()

type HTMLdialog = Interactive (open :: Boolean)

type HTMLdiv = Interactive () -- (onScroll :: Event)

type HTMLdl = Interactive () -- (onScroll :: Event)

type HTMLdt = Interactive () -- (onScroll :: Event)

type HTMLem = Interactive ()

type HTMLembed = Interactive
  ( height :: CSSPixel
  , src :: String
  , type :: MediaType
  , width :: CSSPixel
  )

type HTMLfieldset = Interactive
  ( disabled :: Boolean
  , form :: String
  , name :: String
  -- , onScroll :: Event
  )

type HTMLfigcaption = Interactive ()

type HTMLfigure = Interactive ()

type HTMLfooter = Interactive ()

type HTMLform = Interactive
  ( acceptCharset :: String
  , action :: String
  , autocomplete :: AutocompleteType
  , enctype :: MediaType
  , method :: FormMethod
  , name :: String
  , noValidate :: Boolean
  -- , onReset :: Event
  -- , onScroll :: Event
  -- , onSubmit :: Event
  , target :: String
  )

type HTMLh1 = Interactive () -- (onScroll :: Event)

type HTMLh2 = Interactive () -- (onScroll :: Event)

type HTMLh3 = Interactive () -- (onScroll :: Event)

type HTMLh4 = Interactive () -- (onScroll :: Event)

type HTMLh5 = Interactive () -- (onScroll :: Event)

type HTMLh6 = Interactive () -- (onScroll :: Event)

type HTMLhead = Noninteractive ()

type HTMLheader = Interactive ()

type HTMLhr = Interactive ()

type HTMLhtml = Interactive
  ( manifest :: String
  -- , onScroll :: Event
  , xmlns :: String
  )

type HTMLi = Interactive ()

type HTMLiframe = Noninteractive
  ( height :: CSSPixel
  , name :: String
  -- , onLoad :: Event
  , sandbox :: String
  , src :: String
  , srcDoc :: String
  , width :: CSSPixel
  )

type HTMLimg = Interactive
  ( alt :: String
  , crossOrigin :: CrossOriginValue
  , height :: CSSPixel
  , isMap :: Boolean
  , longDesc :: String
  -- , onAbort :: Event
  -- , onError :: Event
  -- , onLoad :: Event
  , src :: String
  , useMap :: String
  , width :: CSSPixel
  )

type HTMLinput = Interactive
  ( accept :: InputAcceptType
  , autocomplete :: AutocompleteType
  , autofocus :: Boolean
  , checked :: Boolean
  , disabled :: Boolean
  , form :: String
  , formAction :: String
  , formEncType :: MediaType
  , formMethod :: FormMethod
  , formNoValidate :: Boolean
  , formTarget :: String
  , height :: CSSPixel
  , list :: String
  , max :: Number
  , min :: Number
  , maxLength :: Int
  , minLength :: Int
  , multiple :: Boolean
  , name :: String
  -- , onAbort :: Event
  -- , onChange :: Event
  -- , onError :: Event
  -- , onInvalid :: Event
  -- , onLoad :: Event
  -- , onSearch :: Event
  -- , onSelect :: Event
  , pattern :: String
  , placeholder :: String
  , readOnly :: Boolean
  , required :: Boolean
  , size :: Int
  , src :: String
  , step :: StepValue
  , type :: InputType
  , value :: String
  , width :: CSSPixel
  )

type HTMLins = Interactive
  ( cite :: String
  , datetime :: DateTime
  )

type HTMLkbd = Interactive ()

type HTMLlabel = Interactive
  ( for :: String
  , form :: String
  )

type HTMLlegend = Interactive ()

type HTMLli = Interactive
  ( value :: Int
  -- , onScroll :: Event
  )

type HTMLlink = Noninteractive
  ( crossOrigin :: CrossOriginValue
  , href :: String
  , hreflang :: String
  , media :: String
  -- , onLoad :: Event
  , rel :: String
  , sizes :: String
  , type :: MediaType
  )

type HTMLmain = Interactive ()

type HTMLmap = Interactive (name :: String)

type HTMLmark = Interactive ()

type HTMLmenu = Interactive
  ( label :: String
  -- , onScroll :: Event
  , type :: MenuType
  )

type HTMLmenuitem = Interactive
  ( checked :: Boolean
  , command :: String
  , default :: Boolean
  , disabled :: Boolean
  , icon :: String
  , label :: String
  , radioGroup :: String
  , type :: MenuitemType
  )

type HTMLmeta = Noninteractive
  ( charset :: String
  , content :: String
  , httpEquiv :: String
  , name :: String
  )

type HTMLmeter = Interactive
  ( form :: String
  , high :: Number
  , low :: Number
  , max :: Number
  , min :: Number
  , optimum :: Number
  , value :: Number
  )

type HTMLnav = Interactive ()

type HTMLnoscript = Interactive ()

type HTMLobject = Interactive
  ( data :: String
  , form :: String
  , height :: CSSPixel
  , name :: String
  -- , onError :: Event
  -- , onScroll :: Event
  , type :: MediaType
  , useMap :: String
  , width :: CSSPixel
  )

type HTMLol = Interactive
  ( reversed :: Boolean
  , start :: Int
  , type :: OrderedListType
  -- , onScroll :: Event
  )

type HTMLoptgroup = Interactive
  ( disabled :: Boolean
  , label :: String
  )

type HTMLoption = Interactive
  ( disabled :: Boolean
  , label :: String
  , selected :: Boolean
  , value :: String
  )

type HTMLoutput = Interactive
  ( for :: String
  , form :: String
  , name :: String
  )

type HTMLp = Interactive () -- (onScroll :: Event)

type HTMLparam = Noninteractive
  ( name :: String
  , value :: String
  )

type HTMLpre = Interactive () -- (onScroll :: Event)

type HTMLprogress = Interactive
  ( max :: Number
  , value :: Number
  )

type HTMLq = Interactive (cite :: String)

type HTMLrp = Interactive ()

type HTMLrt = Interactive ()

type HTMLruby = Interactive ()

type HTMLsamp = Interactive ()

type HTMLscript = Noninteractive
  ( async :: Boolean
  , charset :: String
  , defer :: Boolean
  -- , onError :: Event
  -- , onLoad :: Event
  , src :: String
  , type :: MediaType
  )

type HTMLsection = Interactive ()

type HTMLselect = Interactive
  ( autofocus :: Boolean
  , disabled :: Boolean
  , form :: String
  , multiple :: Boolean
  , name :: String
  -- , onChange :: Event
  -- , onScroll :: Event
  , required :: Boolean
  , selectedIndex :: Int
  , size :: Int
  , value :: String
  )

type HTMLsmall = Interactive ()

type HTMLsource = Interactive
  ( media :: String
  , src :: String
  , type :: MediaType
  )

type HTMLspan = Interactive ()

type HTMLstrong = Interactive ()

type HTMLstyle = Noninteractive
  ( media :: String
  -- , onError :: Event
  -- , onLoad :: Event
  , scoped :: Boolean
  , type :: MediaType
  )

type HTMLsub = Interactive ()

type HTMLsummary = Interactive ()

type HTMLsup = Interactive ()

type HTMLtable = Interactive (sortable :: Boolean)

type HTMLtbody = Interactive () -- (onScroll :: Event)

type HTMLtd = Interactive
  ( colSpan :: Int
  , headers :: String
  , rowSpan :: Int
  )

type HTMLtextarea = Interactive
  ( autofocus :: Boolean
  , cols :: Int
  , disabled :: Boolean
  , form :: String
  , maxLength :: Int
  , name :: String
  -- , onChange :: Event
  -- , onScroll :: Event
  -- , onSelect :: Event
  , placeholder :: String
  , readOnly :: Boolean
  , required :: Boolean
  , rows :: Int
  , value :: String
  , wrap :: WrapValue
  )

type HTMLtfoot = Interactive () -- (onScroll :: Event)

type HTMLth = Interactive
  ( abbr :: String
  , colSpan :: Int
  , headers :: String
  , rowSpan :: Int
  , scope :: ScopeValue
  , sorted :: Boolean
  )

type HTMLthead = Interactive ()

type HTMLtime = Interactive (datetime :: DateTime)

type HTMLtitle = Noninteractive ()

type HTMLtr = Interactive ()

type HTMLtrack = Interactive
  ( default :: Boolean
  , kind :: KindValue
  , label :: String
  , src :: String
  , srcLang :: String
  )

type HTMLu = Interactive ()

type HTMLul = Interactive () -- (onScroll :: Event)

type HTMLvar = Interactive ()

type HTMLvideo = Interactive
  ( autoplay :: Boolean
  , controls :: Boolean
  , height :: CSSPixel
  , loop :: Boolean
  , muted :: Boolean
  , poster :: String
  , preload :: PreloadValue
  , src :: String
  , width :: CSSPixel
  , type :: MediaType
  -- , onError :: Event
  )

type HTMLwbr = Interactive ()
