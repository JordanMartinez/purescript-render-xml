module RenderXml.Svg.Attributes.Paint
  ( Paint(..)
  , printPaint
  ) where

import Prelude

import Data.Maybe (Maybe, maybe)
import RenderXml.Svg.Attributes.Color (Color, printColor)

data Paint
  = PaintNone
  | PaintColor Color
  | PaintUrl String (Maybe (Maybe Color))
  | PaintContextFill
  | PaintContextStroke

derive instance eqColor :: Eq Paint

instance showColor :: Show Paint where
  show = case _ of
    PaintNone -> "PaintNone"
    PaintColor c -> "(PaintColor " <> show c <> ")"
    PaintUrl url c -> "(PaintUrl " <> show url <> " " <> show c <> ")"
    PaintContextFill -> "PaintContextFill"
    PaintContextStroke -> "PaintContextStroke"

printPaint :: Paint -> String
printPaint = case _ of
  PaintNone -> "none"
  PaintColor c -> printColor c
  PaintUrl url c -> "url(" <> url <> ")" <> maybe "" (maybe " none" (append " " <<< printColor)) c
  PaintContextFill -> "context-fill"
  PaintContextStroke -> "context-stroke"
