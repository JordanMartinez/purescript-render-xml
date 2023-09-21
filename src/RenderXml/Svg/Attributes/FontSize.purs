module RenderXml.Svg.Attributes.FontSize
  ( FontSize(..)
  , printFontSize
  ) where

import Prelude
import RenderXml.Svg.Attributes.CSSLength (CSSLength, printCSSLength)

data FontSize
  = XXSmall
  | XSmall
  | Small
  | Medium
  | Large
  | XLarge
  | XXLarge
  | Smaller
  | Larger
  | FontSizeLength CSSLength

derive instance eqFontSize :: Eq FontSize

instance showFontSize :: Show FontSize where
  show = case _ of
    XXSmall -> "XXSmall"
    XSmall -> "XSmall"
    Small -> "Small"
    Medium -> "Medium"
    Large -> "Large"
    XLarge -> "XLarge"
    XXLarge -> "XXLarge"
    Smaller -> "Smaller"
    Larger -> "Larger"
    FontSizeLength l -> "(FontSizeLength " <> printCSSLength l <> ")"

printFontSize :: FontSize -> String
printFontSize = case _ of
  XXSmall -> "xx-small"
  XSmall -> "x-small"
  Small -> "small"
  Medium -> "medium"
  Large -> "large"
  XLarge -> "x-large"
  XXLarge -> "xx-large"
  Smaller -> "smaller"
  Larger -> "larger"
  FontSizeLength l -> printCSSLength l
