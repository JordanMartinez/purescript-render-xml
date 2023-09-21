module RenderXml.Svg.Core where

import Prelude

import Data.Maybe (Maybe(..))
import RenderXml.Core (Xml, AttrName, DocType(..), ElemName, Namespace(..))
import RenderXml.Core as XmlCore

namespaceSvg :: Namespace
namespaceSvg = Namespace "http://www.w3.org/2000/svg"

foreign import data NamespaceSvg :: XmlCore.Namespace

type Svg = Xml NamespaceSvg

type Prop r = XmlCore.Prop NamespaceSvg r

renderSvg :: Svg -> String
renderSvg = XmlCore.render Nothing

comment :: String -> Svg
comment = XmlCore.comment

-- | Constructs a text node `Xml` value.
textElem :: String -> Svg
textElem = XmlCore.textElem

node :: forall i. ElemName NamespaceSvg -> Array (Prop i) -> Array Svg -> Svg
node  = XmlCore.node

leaf :: forall i. ElemName NamespaceSvg -> Array (Prop i) -> Svg
leaf = XmlCore.leaf

-- | Create a Xml property.
prop :: forall value i. IsSvgProp value => AttrName NamespaceSvg -> value -> Prop i
prop = prop' Nothing

prop' :: forall value i. IsSvgProp value => Maybe Namespace -> AttrName NamespaceSvg -> value -> Prop i
prop' mbNs name val = XmlCore.prop' mbNs name $ toSvgPropValue val

attr :: forall i. AttrName NamespaceSvg -> Prop i
attr = attr' Nothing

attr' :: forall i. Maybe Namespace -> AttrName NamespaceSvg -> Prop i
attr' = XmlCore.attr'

class IsSvgProp a where
  toSvgPropValue :: a -> String

instance isPropString :: IsSvgProp String where
  toSvgPropValue = identity

instance isPropInt :: IsSvgProp Int where
  toSvgPropValue = show <<< show

instance isPropNumber :: IsSvgProp Number where
  toSvgPropValue = show <<< show

instance isPropBoolean :: IsSvgProp Boolean where
  toSvgPropValue = show <<< show

