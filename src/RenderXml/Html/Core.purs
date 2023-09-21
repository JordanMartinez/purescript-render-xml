module RenderXml.Html.Core where

import Prelude

import Data.Maybe (Maybe(..))
import RenderXml.Core (AttrName, DocType(..), ElemName, Namespace(..))
import RenderXml.Core as XmlCore

namespaceHtml :: Namespace
namespaceHtml = Namespace "http://www.w3.org/1999/xhtml"

foreign import data NamespaceHtml :: XmlCore.Namespace

docTypeHtml :: DocType NamespaceHtml
docTypeHtml = DocType "html"

type Html = XmlCore.Xml NamespaceHtml

type Prop r = XmlCore.Prop NamespaceHtml r

renderHtml :: Html -> String
renderHtml = XmlCore.render Nothing

renderHtml' :: Html -> String
renderHtml' = XmlCore.render (Just docTypeHtml)

comment :: String -> Html
comment = XmlCore.comment

-- | Constructs a text node `Xml` value.
textElem :: String -> Html
textElem = XmlCore.textElem

node :: forall i. ElemName NamespaceHtml -> Array (Prop i) -> Array Html -> Html
node = XmlCore.node

transitionNode
  :: forall innerNs i
   . Namespace
  -> ElemName innerNs
  -> Array (XmlCore.Prop innerNs i)
  -> Array (XmlCore.Xml innerNs)
  -> Html
transitionNode = XmlCore.transitionNode

leaf :: forall i. ElemName NamespaceHtml -> Array (Prop i) -> Html
leaf = XmlCore.leaf

transitionLeaf
  :: forall innerNs i
   . Namespace
  -> ElemName innerNs
  -> Array (XmlCore.Prop innerNs i)
  -> Html
transitionLeaf = XmlCore.transitionLeaf

-- | Create a Xml property.
prop :: forall value i. IsHtmlProp value => AttrName NamespaceHtml -> value -> Prop i
prop = prop' Nothing

prop' :: forall value i. IsHtmlProp value => Maybe Namespace -> AttrName NamespaceHtml -> value -> Prop i
prop' mbNs name val = XmlCore.prop' mbNs name $ toHtmlPropValue val

attr :: forall i. AttrName NamespaceHtml -> Prop i
attr = attr' Nothing

attr' :: forall i. Maybe Namespace -> AttrName NamespaceHtml -> Prop i
attr' = XmlCore.attr'

class IsHtmlProp a where
  toHtmlPropValue :: a -> String

instance isPropString :: IsHtmlProp String where
  toHtmlPropValue = identity

instance isPropInt :: IsHtmlProp Int where
  toHtmlPropValue = show

instance isPropNumber :: IsHtmlProp Number where
  toHtmlPropValue = show

instance isPropBoolean :: IsHtmlProp Boolean where
  toHtmlPropValue = show
