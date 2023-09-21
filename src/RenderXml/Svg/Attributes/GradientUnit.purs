module RenderXml.Svg.Attributes.GradientUnit where

import Prelude

import Data.Generic.Rep (class Generic)

data GradientUnit
  = GUUserSpaceOnUse
  | GUObjectBoundingSpace

derive instance Eq GradientUnit
derive instance Ord GradientUnit
derive instance Generic GradientUnit _
instance Show GradientUnit where 
  show = case _ of
    GUUserSpaceOnUse -> "UserSpaceOnUse"
    GUObjectBoundingSpace -> "ObjectBoundingSpace"

printGradientUnit :: GradientUnit -> String
printGradientUnit = case _ of
    GUUserSpaceOnUse -> "userSpaceOnUse"
    GUObjectBoundingSpace -> "objectBoundingSpace"
