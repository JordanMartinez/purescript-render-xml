
-- | Similar to `Halogen.HTML.Properties`. You should always use
-- | this module's entities (e.g. `class_`) over its corresponding
-- | value in `Halogen.HTML.Properties (e.g. `HP.class_`).
-- |
-- | When Algebraic Data Types (ADTs) are used, use the
-- | `show` function to display what the ADT is and the `printX` function
-- | to render the corresponding String value that should appear in the HTML.
module RenderXml.Svg.Attributes
  ( module RenderXml.Svg.Attributes.Align
  , module RenderXml.Svg.Attributes.Baseline
  , module RenderXml.Svg.Attributes.Color
  , module RenderXml.Svg.Attributes.CSSLength
  , module RenderXml.Svg.Attributes.Duration
  , module RenderXml.Svg.Attributes.FillState
  , module RenderXml.Svg.Attributes.FontSize
  , module RenderXml.Svg.Attributes.FontStyle
  , module RenderXml.Svg.Attributes.FontStretch
  , module RenderXml.Svg.Attributes.FontWeight
  , module RenderXml.Svg.Attributes.GradientUnit
  , module RenderXml.Svg.Attributes.MarkerUnit
  , module RenderXml.Svg.Attributes.MaskUnit
  , module RenderXml.Svg.Attributes.MeetOrSlice
  , module RenderXml.Svg.Attributes.Orient
  , module RenderXml.Svg.Attributes.Path
  , module RenderXml.Svg.Attributes.Paint
  , module RenderXml.Svg.Attributes.SpreadMethod
  , module RenderXml.Svg.Attributes.StrokeLineCap
  , module RenderXml.Svg.Attributes.StrokeLineJoin
  , module RenderXml.Svg.Attributes.TextAnchor
  , module RenderXml.Svg.Attributes.Transform
  , attributeName
  , begin
  , class_
  , classes
  , cx
  , cy
  , d
  , dominantBaseline
  , dur
  , fill
  , fillAnim
  , fillOpacity
  , fontFamily
  , fontSize
  , fontSizeAdjust
  , fontStretch
  , fontStyle
  , fontVariant
  , fontWeight
  , from
  , to
  , gradientUnit
  , gradientTransform
  , href
  , id
  , markerStart
  , markerMid
  , markerEnd
  , markerUnits
  , markerWidth
  , markerHeight
  , mask
  , maskUnits
  , maskContentUnits
  , orient
  , offset
  , offsetPercentage
  , path
  , pathLength
  , patternContentUnits
  , patternTransform
  , patternUnits
  , points
  , preserveAspectRatio
  , r
  , refX
  , refY
  , repeatCount
  , rx
  , ry
  , spreadMethod
  , stopColor
  , stopOpacity
  , stroke
  , strokeDashArray
  , strokeDashOffset
  , strokeLineCap
  , strokeLineJoin
  , strokeMiterLimit
  , strokeOpacity
  , strokeWidth
  , textAnchor
  , transform
  , viewBox
  , width
  , height
  , x
  , y
  , x1
  , y1
  , x2
  , y2
  , x1Percent
  , y1Percent
  , x2Percent
  , y2Percent
  , xmlnsXLink
  , xmlnsXLink'
  ) where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe(..), maybe)
import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import RenderXml.Svg.Core (Prop, prop)
import RenderXml.Core (AttrName(..))
import RenderXml.Svg.Attributes.Align (Align(..), printAlign)
import RenderXml.Svg.Attributes.Baseline (Baseline(..), printBaseline)
import RenderXml.Svg.Attributes.CSSLength (CSSLength(..), printCSSLength)
import RenderXml.Svg.Attributes.Color (Color(..), printColor)
import RenderXml.Svg.Attributes.Duration (Duration)
import RenderXml.Svg.Attributes.FillState (FillState(..), printFillState)
import RenderXml.Svg.Attributes.FontSize (FontSize(..), printFontSize)
import RenderXml.Svg.Attributes.FontStretch (FontStretch, printFontStretch)
import RenderXml.Svg.Attributes.FontStyle (FontStyle, printFontStyle)
import RenderXml.Svg.Attributes.FontWeight (FontWeight, printFontWeight)
import RenderXml.Svg.Attributes.GradientUnit (GradientUnit(..), printGradientUnit)
import RenderXml.Svg.Attributes.MarkerUnit (MarkerUnit(..), printMarkerUnit)
import RenderXml.Svg.Attributes.MaskUnit (MaskUnit(..), printMaskUnit)
import RenderXml.Svg.Attributes.MeetOrSlice (MeetOrSlice(..), printMeetOrSlice)
import RenderXml.Svg.Attributes.Orient (Orient(..), printOrient)
import RenderXml.Svg.Attributes.Paint (Paint(..), printPaint)
import RenderXml.Svg.Attributes.Path (PathCommand, CommandPositionReference(..), CommandArcChoice(..), CommandSweepChoice(..), toArrayString, m, l, h, v, c, s, q, t, a, z)
import RenderXml.Svg.Attributes.SpreadMethod (SpreadMethod(..), printSpreadMethod)
import RenderXml.Svg.Attributes.StrokeLineCap (StrokeLineCap, printStrokeLineCap)
import RenderXml.Svg.Attributes.StrokeLineJoin (StrokeLineJoin, printStrokeLineJoin)
import RenderXml.Svg.Attributes.TextAnchor (TextAnchor(..), printTextAnchor)
import RenderXml.Svg.Attributes.Transform (Transform(..), printTransform)

attributeName :: forall r. String -> Prop (attributeName :: String | r)
attributeName = prop (AttrName "attributeName")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
begin :: forall r. String -> Prop (begin :: String | r)
begin = prop (AttrName "begin") <<< show

class_ :: forall r. String -> Prop (class :: String | r)
class_ = prop (AttrName "class") <<< show

classes :: forall r. Array String -> Prop (class :: String | r)
classes = class_ <<< joinWith " "

cx :: forall r. Number -> Prop (cx :: Number | r)
cx = prop (AttrName "cx") <<< show <<< show

cy :: forall r. Number -> Prop (cy :: Number | r)
cy = prop (AttrName "cy") <<< show <<< show

d :: forall r. Array PathCommand -> Prop (d :: String | r)
d = prop (AttrName "d") <<< show <<< joinWith " " <<< toArrayString

dominantBaseline :: forall r. Baseline -> Prop (dominantBaseline :: String | r)
dominantBaseline = prop (AttrName "dominant-baseline") <<< show <<< printBaseline

dur :: forall r. Duration -> Prop (dur :: String | r)
dur = prop (AttrName "dur") <<< show <<< printDuration
  where
  printDuration :: Duration -> String
  printDuration { hours, minutes, seconds, milliseconds } =
    f "h" hours <> f "m" minutes <> f "s" seconds <> f "i" milliseconds

  f unit_ = maybe "" (\val -> show val <> unit_)

fill :: forall r. Paint -> Prop (fill :: String | r)
fill = prop (AttrName "fill") <<< show <<< printPaint

-- Note: same as 'fill' but that function is already specialised to Paint
fillAnim :: forall r. FillState -> Prop (fill :: String | r)
fillAnim = prop (AttrName "fill") <<< show <<< printFillState

fillOpacity :: forall r. Number -> Prop (fillOpacity :: Number | r)
fillOpacity = prop (AttrName "fill-opacity") <<< show <<< show

fontFamily :: forall r. String -> Prop (fontFamily :: String | r)
fontFamily = prop (AttrName "font-family") <<< show

fontSize :: forall r. FontSize -> Prop (fontSize :: String | r)
fontSize = prop (AttrName "font-size") <<< show <<< printFontSize

fontSizeAdjust :: forall r. Number -> Prop (fontSizeAdjust :: String | r)
fontSizeAdjust = prop (AttrName "font-size-adjust") <<< show <<< show

fontStretch :: forall r. FontStretch -> Prop (fontStretch :: String | r)
fontStretch = prop (AttrName "font-stretch") <<< show <<< printFontStretch

fontStyle :: forall r. FontStyle -> Prop (fontStyle :: String | r)
fontStyle = prop (AttrName "font-style") <<< show <<< printFontStyle

fontVariant :: forall r. String -> Prop (fontVariant :: String | r)
fontVariant = prop (AttrName "font-variant") <<< show

fontWeight :: forall r. FontWeight -> Prop (fontWeight :: String | r)
fontWeight = prop (AttrName "font-weight") <<< show <<< printFontWeight

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
from :: forall r. String -> Prop (from :: String | r)
from = prop (AttrName "from") <<< show

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
to :: forall r. String -> Prop (to :: String | r)
to = prop (AttrName "to") <<< show

id :: forall r. String -> Prop (id :: String | r)
id = prop (AttrName "id") <<< show

gradientUnit :: forall r. GradientUnit -> Prop (gradientUnit :: String | r)
gradientUnit = prop (AttrName "gradientUnit") <<< show <<< printGradientUnit

gradientTransform :: forall r. Array String -> Prop (gradientTransform :: String | r)
gradientTransform = prop (AttrName "gradientTransform") <<< show <<< joinWith " "

spreadMethod :: forall r. SpreadMethod -> Prop (spreadMethod :: String | r)
spreadMethod = prop (AttrName "spreadMethod") <<< show <<< printSpreadMethod

markerStart :: forall r. String -> Prop (markerStart :: String | r)
markerStart = prop (AttrName "marker-start") <<< show

markerMid :: forall r. String -> Prop (markerMid :: String | r)
markerMid = prop (AttrName "marker-mid") <<< show

markerEnd :: forall r. String -> Prop (markerEnd :: String | r)
markerEnd = prop (AttrName "marker-end") <<< show

markerUnits :: forall r. MarkerUnit -> Prop (markerUnits :: String | r)
markerUnits = prop (AttrName "markerUnits") <<< show <<< printMarkerUnit

markerWidth :: forall r. Number -> Prop (markerWidth :: Number | r)
markerWidth = prop (AttrName "markerWidth") <<< show <<< show

markerHeight :: forall r. Number -> Prop (markerHeight :: Number | r)
markerHeight = prop (AttrName "markerHeight") <<< show <<< show

mask :: forall r. String -> Prop (mask :: String | r)
mask = prop (AttrName "mask") <<< show

maskUnits :: forall r. MaskUnit -> Prop (maskUnits :: String | r)
maskUnits = prop (AttrName "maskUnits") <<< show <<< printMaskUnit

maskContentUnits :: forall r. MaskUnit -> Prop (maskContentUnits :: String | r)
maskContentUnits = prop (AttrName "maskContentUnits") <<< show <<< printMaskUnit

orient :: forall r. Orient -> Prop (orient :: String | r)
orient = prop (AttrName "orient") <<< show <<< printOrient

offset :: forall r. Number -> Prop (offset :: String | r)
offset = _offset <<< show

offsetPercentage :: forall r. Number -> Prop (offset :: String | r)
offsetPercentage = _offset <<< toPercentage

_offset :: forall r. String -> Prop (offset :: String | r)
_offset = prop (AttrName "offset") <<< show

path :: forall r. Array PathCommand -> Prop (path :: String | r)
path = prop (AttrName "path") <<< show <<< joinWith " " <<< toArrayString

-- | An array of x-y value pairs (e.g. `[ Tuple x y ]`).
points :: forall r. Array (Tuple Number Number) -> Prop (points :: String | r)
points = prop (AttrName "points") <<< show <<< Array.intercalate " " <<< map (\(Tuple x_ y_) -> show x_ <> "," <> show y_)

pathLength :: forall r. Number -> Prop (pathLength :: Number | r)
pathLength = prop (AttrName "pathLength") <<< show <<< show
 
patternContentUnits :: forall r. String -> Prop (patternContentUnits :: String | r)
patternContentUnits = prop (AttrName "patternContentUnits") <<< show

patternTransform :: forall r. Array Transform -> Prop (patternTransform :: String | r)
patternTransform = prop (AttrName "patternTransform") <<< show <<< joinWith " " <<< map printTransform

patternUnits :: forall r. String -> Prop (patternUnits :: String | r)
patternUnits = prop (AttrName "patternUnits") <<< show

preserveAspectRatio
  :: forall r
   . Maybe { x_ :: Align, y_ :: Align }
  -> MeetOrSlice
  -> Prop (preserveAspectRatio :: String | r)
preserveAspectRatio align slice = prop
  (AttrName "preserveAspectRatio")
  (show $ joinWith " " $ [ align_str, printMeetOrSlice slice ])
  where
  align_str = case align of
    Nothing -> "none"
    Just { x_, y_ } -> joinWith "" $ [ "x", printAlign x_, "Y", printAlign y_ ]

r :: forall s. Number -> Prop (r :: Number | s)
r = prop (AttrName "r") <<< show <<< show

refX :: forall r. Number -> Prop (refX :: Number | r)
refX = prop (AttrName "refX") <<< show <<< show

refY :: forall r. Number -> Prop (refY :: Number | r)
refY = prop (AttrName "refY") <<< show <<< show

repeatCount :: forall r. String -> Prop (repeatCount :: String | r)
repeatCount = prop (AttrName "repeatCount") <<< show

rx :: forall r. Number -> Prop (rx :: Number | r)
rx = prop (AttrName "rx") <<< show <<< show

ry :: forall r. Number -> Prop (ry :: Number | r)
ry = prop (AttrName "ry") <<< show <<< show

stopColor :: forall r. Paint -> Prop (stopColor :: String | r)
stopColor = prop (AttrName "stop-color") <<< show <<< printPaint

stopOpacity :: forall r. Number -> Prop (stopOpacity :: Number | r)
stopOpacity = prop (AttrName "stop-opacity") <<< show <<< show

stroke :: forall r. Paint -> Prop (stroke :: String | r)
stroke = prop (AttrName "stroke") <<< show <<< printPaint

strokeDashArray :: forall r. String -> Prop (strokeDashArray :: String | r)
strokeDashArray = prop (AttrName "stroke-dasharray") <<< show

strokeDashOffset :: forall r. Number -> Prop (strokeDashOffset :: String | r)
strokeDashOffset = prop (AttrName "stroke-dashoffset") <<< show <<< show

strokeLineCap :: forall r. StrokeLineCap -> Prop (strokeLineCap :: String | r)
strokeLineCap = prop (AttrName "stroke-linecap") <<< show <<< printStrokeLineCap

strokeLineJoin :: forall r. StrokeLineJoin -> Prop (strokeLineJoin :: String | r)
strokeLineJoin = prop (AttrName "stroke-linejoin") <<< show <<< printStrokeLineJoin

-- | The `Number` arg must be greater than or equal to 1. Thus, this function
-- | will use `1.0` if given any value less than `1.0`.
strokeMiterLimit :: forall r. Number -> Prop (strokeMiterLimit :: String | r)
strokeMiterLimit = prop (AttrName "stroke-miterlimit") <<< show <<< show <<< max 1.0

strokeOpacity :: forall r. Number -> Prop (strokeOpacity :: Number | r)
strokeOpacity = prop (AttrName "stroke-opacity") <<< show <<< show

strokeWidth :: forall r. Number -> Prop (strokeWidth :: Number | r)
strokeWidth = prop (AttrName "stroke-width") <<< show <<< show

textAnchor :: forall r. TextAnchor -> Prop (textAnchor :: String | r)
textAnchor = prop (AttrName "text-anchor") <<< show <<< printTextAnchor

transform :: forall r. Array Transform -> Prop (transform :: String | r)
transform = prop (AttrName "transform") <<< show <<< joinWith " " <<< map printTransform

viewBox
  :: forall r
   . Number
  -> Number
  -> Number
  -> Number
  -> Prop (viewBox :: String | r)
viewBox x_ y_ w h_ =
  prop (AttrName "viewBox") (show $ joinWith " " $ map show [ x_, y_, w, h_ ])

width :: forall r. Number -> Prop (width :: Number | r)
width = prop (AttrName "width") <<< show <<< show

height :: forall r. Number -> Prop (height :: Number | r)
height = prop (AttrName "height") <<< show <<< show

x :: forall r. Number -> Prop (x :: Number | r)
x = prop (AttrName "x") <<< show <<< show

y :: forall r. Number -> Prop (y :: Number | r)
y = prop (AttrName "y") <<< show <<< show

x1 :: forall r. Number -> Prop (x1 :: String | r)
x1 = _x1 <<< show <<< show

y1 :: forall r. Number -> Prop (y1 :: String | r)
y1 = _y1 <<< show <<< show

x2 :: forall r. Number -> Prop (x2 :: String | r)
x2 = _x2 <<< show <<< show

y2 :: forall r. Number -> Prop (y2 :: String | r)
y2 = _y2 <<< show <<< show

-- | `toPercentage 4.0 == "4.0%`
toPercentage :: Number -> String
toPercentage = show <<< flip append "%" <<< show

x1Percent :: forall r. Number -> Prop (x1 :: String | r)
x1Percent = _x1 <<< toPercentage

y1Percent :: forall r. Number -> Prop (y1 :: String | r)
y1Percent = _y1 <<< toPercentage

x2Percent :: forall r. Number -> Prop (x2 :: String | r)
x2Percent = _x2 <<< toPercentage

y2Percent :: forall r. Number -> Prop (y2 :: String | r)
y2Percent = _y2 <<< toPercentage

_x1 :: forall r. String -> Prop (x1 :: String | r)
_x1 = prop (AttrName "x1")

_y1 :: forall r. String -> Prop (y1 :: String | r)
_y1 = prop (AttrName "y1")

_x2 :: forall r. String -> Prop (x2 :: String | r)
_x2 = prop (AttrName "x2")

_y2 :: forall r. String -> Prop (y2 :: String | r)
_y2 = prop (AttrName "y2")

xmlnsXLink :: forall r. Prop ("xmlns:xlink" :: String | r)
xmlnsXLink = xmlnsXLink' "http://www.w3.org/1999/xlink"

xmlnsXLink' :: forall r. String -> Prop ("xmlns:xlink" :: String | r)
xmlnsXLink' = prop (AttrName "xmlns:xlink") <<< show

href :: forall r. String -> Prop (href :: String | r)
href = prop (AttrName "href") <<< show
