module RenderXml.Svg.Attributes.SpreadMethod where

import Prelude

import Data.Generic.Rep (class Generic)

data SpreadMethod
  = Pad
  | Reflect
  | Repeat

derive instance Eq SpreadMethod
derive instance Ord SpreadMethod
derive instance Generic SpreadMethod _
instance Show SpreadMethod where
  show = case _ of
    Pad -> "Pad"
    Reflect -> "Reflect"
    Repeat -> "Repeat"

printSpreadMethod :: SpreadMethod -> String
printSpreadMethod = case _ of
  Pad -> "pad"
  Reflect -> "reflect"
  Repeat -> "repeat"
