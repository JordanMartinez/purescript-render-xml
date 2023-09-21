module RenderXml.Html.Attributes
  ( expand

  , alt
  , charset
  , class_
  , classes
  , cols
  , rows
  , colSpan
  , rowSpan
  , for
  , height
  , width
  , href
  , id
  , name
  , rel
  , src
  , srcDoc
  , style
  , scope
  , target
  , title
  , download

  , method
  , action
  , enctype
  , noValidate

  , type_
  , value
  , min
  , max
  , step
  , disabled
  , required
  , readOnly
  , spellcheck
  , checked
  , selected
  , selectedIndex
  , placeholder
  , autocomplete
  , list
  , autofocus
  , multiple
  , pattern
  , accept

  , autoplay
  , controls
  , loop
  , muted
  , poster
  , preload

  , draggable
  , tabIndex

  , module I
  ) where

import Prelude

import DOM.HTML.Indexed (CSSPixel) as I
import DOM.HTML.Indexed.AutocompleteType (AutocompleteType(..), renderAutocompleteType) as I
import DOM.HTML.Indexed.ButtonType (ButtonType(..)) as I
import DOM.HTML.Indexed.FormMethod (FormMethod(..), renderFormMethod) as I
import DOM.HTML.Indexed.InputAcceptType (InputAcceptType(..), renderInputAcceptType) as I
import DOM.HTML.Indexed.InputType (InputType(..)) as I
import DOM.HTML.Indexed.MenuType (MenuType(..)) as I
import DOM.HTML.Indexed.MenuitemType (MenuitemType(..), renderMenuitemType) as I
import DOM.HTML.Indexed.OrderedListType (OrderedListType(..)) as I
import DOM.HTML.Indexed.PreloadValue (PreloadValue(..), renderPreloadValue) as I
import DOM.HTML.Indexed.ScopeValue (ScopeValue(..), renderScopeValue) as I
import DOM.HTML.Indexed.StepValue (StepValue(..), renderStepValue) as I
import Data.MediaType (MediaType)
import Data.Newtype (unwrap)
import Data.String (joinWith)
import Prim.Row as Row
import RenderXml.Html.Core (Prop, class IsHtmlProp, toHtmlPropValue, attr, prop)
import RenderXml.Core (AttrName(..))
import Unsafe.Coerce (unsafeCoerce)

-- | Every `Prop lt i` can be cast to some `Prop gt i` as long as `lt` is a
-- | subset of `gt`.
expand :: forall lt gt a. Row.Union lt a gt => Prop lt -> Prop gt
expand = unsafeCoerce

alt :: forall r. String -> Prop (alt :: String | r)
alt = prop (AttrName "alt") <<< show

charset :: forall r. String -> Prop (charset :: String | r)
charset = prop (AttrName "charset") <<< show

class_ :: forall r. String -> Prop (class :: String | r)
class_ = prop (AttrName "class") <<< show

classes :: forall r. Array String -> Prop (class :: String | r)
classes = class_ <<< show <<< joinWith " "

cols :: forall r. Int -> Prop (cols :: Int | r)
cols = prop (AttrName "cols") <<< show

rows :: forall r. Int -> Prop (rows :: Int | r)
rows = prop (AttrName "rows") <<< show

colSpan :: forall r. Int -> Prop (colSpan :: Int | r)
colSpan = prop (AttrName "colSpan") <<< show

rowSpan :: forall r. Int -> Prop (rowSpan :: Int | r)
rowSpan = prop (AttrName "rowSpan") <<< show

for :: forall r. String -> Prop (for :: String | r)
for = prop (AttrName "HtmlFor") <<< show

height :: forall r. I.CSSPixel -> Prop (height :: I.CSSPixel | r)
height = prop (AttrName "height") <<< show

width :: forall r. I.CSSPixel -> Prop (width :: I.CSSPixel | r)
width = prop (AttrName "width") <<< show

href :: forall r. String -> Prop (href :: String | r)
href = prop (AttrName "href") <<< show

id :: forall r. String -> Prop (id :: String | r)
id = prop (AttrName "id") <<< show

name :: forall r. String -> Prop (name :: String | r)
name = prop (AttrName "name") <<< show

rel :: forall r. String -> Prop (rel :: String | r)
rel = prop (AttrName "rel") <<< show

src :: forall r. String -> Prop (src :: String | r)
src = prop (AttrName "src") <<< show

srcDoc :: forall r. String -> Prop (srcDoc :: String | r)
srcDoc = prop (AttrName "srcdoc") <<< show

-- | Sets the `style` attribute to the specified string.
-- |
-- | ```purs
-- | ... [ style "height: 50px;" ]
-- | ```
style :: forall r. String -> Prop (style :: String | r)
style = prop (AttrName "style") <<< show

scope :: forall r. I.ScopeValue -> Prop (scope :: I.ScopeValue | r)
scope = prop (AttrName "scope") <<< show <<< I.renderScopeValue

target :: forall r. String -> Prop (target :: String | r)
target = prop (AttrName "target") <<< show

title :: forall r. String -> Prop (title :: String | r)
title = prop (AttrName "title") <<< show

download :: forall r. String -> Prop (download :: String | r)
download = prop (AttrName "download") <<< show

method :: forall r. I.FormMethod -> Prop (method :: I.FormMethod | r)
method = prop (AttrName "method") <<< show <<< I.renderFormMethod

action :: forall r. String -> Prop (action :: String | r)
action = prop (AttrName "action") <<< show

enctype :: forall r. MediaType -> Prop (enctype :: MediaType | r)
enctype = prop (AttrName "enctype") <<< show <<< unwrap

noValidate :: forall r. Boolean -> Prop (noValidate :: Boolean | r)
noValidate = prop (AttrName "noValidate") <<< show

type_ :: forall r value. IsHtmlProp value => value -> Prop (type :: value | r)
type_ = prop (AttrName "type") <<< toHtmlPropValue

value :: forall r value. IsHtmlProp value => value -> Prop (value :: value | r)
value = prop (AttrName "value") <<< toHtmlPropValue

min :: forall r. Number -> Prop (min :: Number | r)
min = prop (AttrName "min") <<< show

max :: forall r. Number -> Prop (max :: Number | r)
max = prop (AttrName "max") <<< show

step :: forall r. I.StepValue -> Prop (step :: I.StepValue | r)
step = prop (AttrName "step") <<< show <<< I.renderStepValue

disabled :: forall r. Prop (disabled :: Boolean | r)
disabled = attr (AttrName "disabled")

required :: forall r. Prop (required :: Boolean | r)
required = attr (AttrName "required")

readOnly :: forall r. Prop (readOnly :: Boolean | r)
readOnly = attr (AttrName "readOnly")

spellcheck :: forall r. Boolean -> Prop (spellcheck :: Boolean | r)
spellcheck = prop (AttrName "spellcheck") <<< show

checked :: forall r. Prop (checked :: Boolean | r)
checked = attr (AttrName "checked")

selected :: forall r. Prop (selected :: Boolean | r)
selected = attr (AttrName "selected")

selectedIndex :: forall r. Int -> Prop (selectedIndex :: Int | r)
selectedIndex = prop (AttrName "selectedIndex") <<< show

placeholder :: forall r. String -> Prop (placeholder :: String | r)
placeholder = prop (AttrName "placeholder") <<< show

autocomplete :: forall r. I.AutocompleteType -> Prop (autocomplete :: I.AutocompleteType | r)
autocomplete = prop (AttrName "autocomplete") <<< show <<< I.renderAutocompleteType

list :: forall r. String -> Prop (list :: String | r)
list = prop (AttrName "list") <<< show

autofocus :: forall r. Prop (autofocus :: Boolean | r)
autofocus = attr (AttrName "autofocus")

multiple :: forall r. Prop (multiple :: Boolean | r)
multiple = attr (AttrName "multiple")

accept :: forall r. I.InputAcceptType -> Prop (accept :: I.InputAcceptType | r)
accept = prop (AttrName "accept") <<< show <<< I.renderInputAcceptType

pattern :: forall r. String -> Prop (pattern :: String | r)
pattern = prop (AttrName "pattern") <<< show

autoplay :: forall r. Prop (autoplay :: Boolean | r)
autoplay = attr (AttrName "autoplay")

controls :: forall r. Prop (controls :: Boolean | r)
controls = attr (AttrName "controls")

loop :: forall r. Prop (loop :: Boolean | r)
loop = attr (AttrName "loop")

muted :: forall r. Prop (muted :: Boolean | r)
muted = attr (AttrName "muted")

poster :: forall r. String -> Prop (poster :: String | r)
poster = prop (AttrName "poster") <<< show

preload :: forall r. I.PreloadValue -> Prop (preload :: I.PreloadValue | r)
preload = prop (AttrName "preload") <<< show <<< I.renderPreloadValue

draggable :: forall r. Boolean -> Prop (draggable :: Boolean | r)
draggable = prop (AttrName "draggable") <<< show

tabIndex :: forall r. Int -> Prop (tabIndex :: Int | r)
tabIndex = prop (AttrName "tabIndex") <<< show
