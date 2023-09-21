module RenderXml.Svg.Indexed.Color
  ( Color(..)
  , printColor
  ) where

import Prelude

data Color
  = RGB String String String
  | Hex String
  | Named String

derive instance eqColor :: Eq Color

instance showColor :: Show Color where
  show = case _ of
    RGB r g b -> "(RGB " <> show r <> " " <> show g <> " " <> show b <> ")"
    Hex s -> "(Hex " <> show s <> ")"
    Named s -> "(Named " <> show s <> ")"

printColor :: Color -> String
printColor = case _ of
  RGB r g b -> "rgb(" <> r <> "," <> g <> "," <> b <> ")"
  Hex str -> "#" <> str
  Named str -> str
