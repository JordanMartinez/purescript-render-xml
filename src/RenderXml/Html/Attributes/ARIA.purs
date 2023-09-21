module RenderXml.Html.Attributes.ARIA where

import RenderXml.Html.Core (Prop, prop)
import RenderXml.Core (AttrName(..))

activeDescendant :: forall r. String -> Prop r
activeDescendant = prop (AttrName "aria-activedescendant")

atomic :: forall r. String -> Prop r
atomic = prop (AttrName "aria-atomic")

autoComplete :: forall r. String -> Prop r
autoComplete = prop (AttrName "aria-autocomplete")

busy :: forall r. String -> Prop r
busy = prop (AttrName "aria-busy")

checked :: forall r. String -> Prop r
checked = prop (AttrName "aria-checked")

controls :: forall r. String -> Prop r
controls = prop (AttrName "aria-controls")

current :: forall r. String -> Prop r
current = prop (AttrName "aria-current")

describedBy :: forall r. String -> Prop r
describedBy = prop (AttrName "aria-describedby")

disabled :: forall r. String -> Prop r
disabled = prop (AttrName "aria-disabled")

dropEffect :: forall r. String -> Prop r
dropEffect = prop (AttrName "aria-dropeffect")

expanded :: forall r. String -> Prop r
expanded = prop (AttrName "aria-expanded")

flowTo :: forall r. String -> Prop r
flowTo = prop (AttrName "aria-flowto")

grabbed :: forall r. String -> Prop r
grabbed = prop (AttrName "aria-grabbed")

hasPopup :: forall r. String -> Prop r
hasPopup = prop (AttrName "aria-haspopup")

hidden :: forall r. String -> Prop r
hidden = prop (AttrName "aria-hidden")

invalid :: forall r. String -> Prop r
invalid = prop (AttrName "aria-invalid")

label :: forall r. String -> Prop r
label = prop (AttrName "aria-label")

labelledBy :: forall r. String -> Prop r
labelledBy = prop (AttrName "aria-labelledby")

level :: forall r. String -> Prop r
level = prop (AttrName "aria-level")

live :: forall r. String -> Prop r
live = prop (AttrName "aria-live")

modal :: forall r. String -> Prop r
modal = prop (AttrName "aria-modal")

multiLine :: forall r. String -> Prop r
multiLine = prop (AttrName "aria-multiline")

multiSelectable :: forall r. String -> Prop r
multiSelectable = prop (AttrName "aria-multiselectable")

orientation :: forall r. String -> Prop r
orientation = prop (AttrName "aria-orientation")

owns :: forall r. String -> Prop r
owns = prop (AttrName "aria-owns")

posInSet :: forall r. String -> Prop r
posInSet = prop (AttrName "aria-posinset")

pressed :: forall r. String -> Prop r
pressed = prop (AttrName "aria-pressed")

readOnly :: forall r. String -> Prop r
readOnly = prop (AttrName "aria-readonly")

relevant :: forall r. String -> Prop r
relevant = prop (AttrName "aria-relevant")

required :: forall r. String -> Prop r
required = prop (AttrName "aria-required")

selected :: forall r. String -> Prop r
selected = prop (AttrName "aria-selected")

setSize :: forall r. String -> Prop r
setSize = prop (AttrName "aria-setsize")

sort :: forall r. String -> Prop r
sort = prop (AttrName "aria-sort")

valueMax :: forall r. String -> Prop r
valueMax = prop (AttrName "aria-valuemax")

valueMin :: forall r. String -> Prop r
valueMin = prop (AttrName "aria-valuemin")

valueNow :: forall r. String -> Prop r
valueNow = prop (AttrName "aria-valuenow")

valueText :: forall r. String -> Prop r
valueText = prop (AttrName "aria-valuetext")

role :: forall r. String -> Prop r
role = prop (AttrName "role")
