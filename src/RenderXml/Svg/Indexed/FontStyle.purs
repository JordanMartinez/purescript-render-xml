module RenderXml.Svg.Indexed.FontStyle
  ( FontStyle(..)
  , printFontStyle
  ) where

import Prelude

data FontStyle
  = FStyleNormal
  | FStyleItalic
  | FStyleOblique

derive instance eqFontStyle :: Eq FontStyle

instance showFontStyle :: Show FontStyle where
  show = case _ of
    FStyleNormal -> "FStyleNormal"
    FStyleItalic -> "FStyleItalic"
    FStyleOblique -> "FStyleOblique"

printFontStyle :: FontStyle -> String
printFontStyle = case _ of
  FStyleNormal -> "normal"
  FStyleItalic -> "italic"
  FStyleOblique -> "oblique"
