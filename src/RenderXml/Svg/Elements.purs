-- | Similar to `Halogen.HTML as HH` but contains SVG elements.
-- | We recommend importing this module via the `SE` module alias:
-- | ```
-- | import RenderXml.Svg.Elements as SE
-- | ```
module RenderXml.Svg.Elements
  ( svg
  , g
  , circle
  , image
  , ellipse
  , rect
  , path
  , pattern
  , line
  , polyline
  , polygon
  , text
  , foreignObject
  , defs
  , mask
  , marker
  , linearGradient
  , stop
  , animate
  , animateMotion
  , circleNode
  , mpath
  , title
  , use
  , module Exports
  ) where

-- Like Halogen.HTML.Elements

import Prelude
import RenderXml.Svg.Core (Svg, Prop, namespaceSvg, node, leaf)
import RenderXml.Svg.Indexed as I
import RenderXml.Core (ElemName(..))
import RenderXml.Core as XmlCore
import RenderXml.Svg.Core (textElem) as Exports

-- | An Html element that admits children.
type Node r = Array (Prop r) -> Array Svg -> Svg

-- | An Html element that does not admit children.
type Leaf r = Array (Prop r) -> Svg

svg :: forall outerNs. Array (Prop I.SVGsvg) -> Array Svg -> XmlCore.Xml outerNs
svg = XmlCore.transitionNode namespaceSvg $ ElemName "svg"

g :: Node I.SVGg
g = node $ ElemName "g"

circle :: Leaf I.SVGcircle
circle props = leaf (ElemName "circle") props

image :: Leaf I.SVGimage
image props = leaf (ElemName "image") props

ellipse :: Leaf I.SVGellipse
ellipse props = leaf (ElemName "ellipse") props

rect :: Leaf I.SVGrect
rect props = leaf (ElemName "rect") props

path :: Leaf I.SVGpath
path props = leaf (ElemName "path") props

pattern :: Node I.SVGpattern
pattern = node (ElemName "pattern")

line :: Leaf I.SVGline
line props = leaf (ElemName "line") props

polyline :: Leaf I.SVGpolyline
polyline props = leaf (ElemName "polyline") props

polygon :: Leaf I.SVGpolygon
polygon props = leaf (ElemName "polygon") props

text :: Node I.SVGtext
text = node (ElemName "text")

use :: Leaf I.SVGuse
use props = leaf (ElemName "use") props

foreignObject :: Node I.SVGforeignObject
foreignObject = node (ElemName "foreignObject")

defs :: Node I.SVGg
defs = node $ ElemName "defs"

mask :: Node I.SVGg
mask = node $ ElemName "mask"

marker :: Node I.SVGmarker
marker = node $ ElemName "marker"

--------------------------------------------------------------------------------

linearGradient :: Node I.SVGlinearGradient
linearGradient props = node (ElemName "linearGradient") props

stop :: Node I.SVGstop
stop props = node (ElemName "stop") props

stop_ :: Array Svg -> Svg
stop_ = node (ElemName "stop") []

--------------------------------------------------------------------------------

animate :: Leaf I.SVGanimate
animate props = leaf (ElemName "animate") props

animateMotion :: Node I.SVGanimateMotion
animateMotion = node (ElemName "animateMotion")

circleNode :: Node I.SVGcircle
circleNode = node (ElemName "circle")

mpath :: Node I.SVGmpath
mpath props = node (ElemName "mpath") props

--------------------------------------------------------------------------------

title :: Node I.SVGtitle
title = node (ElemName "title")
