module RenderXml.Html.Core where

import Prelude

import Data.Maybe (Maybe(..))
import Data.MediaType (MediaType)
import Data.Newtype (unwrap)
import RenderXml.Core (AttrName, DocType(..), ElemName, Namespace(..))
import RenderXml.Core as XmlCore
import RenderXml.Html.Indexed.AutocompleteType (AutocompleteType, renderAutocompleteType)
import RenderXml.Html.Indexed.ButtonType (ButtonType, renderButtonType)
import RenderXml.Html.Indexed.CrossOriginValue (CrossOriginValue, renderCrossOriginValue)
import RenderXml.Html.Indexed.DirValue (DirValue, renderDirValue)
import RenderXml.Html.Indexed.FormMethod (FormMethod, renderFormMethod)
import RenderXml.Html.Indexed.InputAcceptType (InputAcceptType, renderInputAcceptType)
import RenderXml.Html.Indexed.InputType (InputType, renderInputType)
import RenderXml.Html.Indexed.KindValue (KindValue, renderKindValue)
import RenderXml.Html.Indexed.MenuType (MenuType, renderMenuType)
import RenderXml.Html.Indexed.MenuitemType (MenuitemType, renderMenuitemType)
import RenderXml.Html.Indexed.OrderedListType (OrderedListType, renderOrderedListType)
import RenderXml.Html.Indexed.PreloadValue (PreloadValue, renderPreloadValue)
import RenderXml.Html.Indexed.ScopeValue (ScopeValue, renderScopeValue)
import RenderXml.Html.Indexed.StepValue (StepValue, renderStepValue)
import RenderXml.Html.Indexed.WrapValue (WrapValue, renderWrapValue)

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

instance isPropMediaType :: IsHtmlProp MediaType where
  toHtmlPropValue = show <<< unwrap

instance isPropButtonType :: IsHtmlProp ButtonType where
  toHtmlPropValue = show <<< renderButtonType

instance isPropCrossOriginValue :: IsHtmlProp CrossOriginValue where
  toHtmlPropValue = show <<< renderCrossOriginValue

instance isPropDirValue :: IsHtmlProp DirValue where
  toHtmlPropValue = show <<< renderDirValue

instance isPropFormMethod :: IsHtmlProp FormMethod where
  toHtmlPropValue = show <<< renderFormMethod

instance isPropInputType :: IsHtmlProp InputType where
  toHtmlPropValue = show <<< renderInputType

instance isPropKindValue :: IsHtmlProp KindValue where
  toHtmlPropValue = show <<< renderKindValue

instance isPropMenuitemType :: IsHtmlProp MenuitemType where
  toHtmlPropValue = show <<< renderMenuitemType

instance isPropMenuType :: IsHtmlProp MenuType where
  toHtmlPropValue = show <<< renderMenuType

instance isPropAutocompleteType :: IsHtmlProp AutocompleteType where
  toHtmlPropValue = show <<< renderAutocompleteType

instance isPropOrderedListType :: IsHtmlProp OrderedListType where
  toHtmlPropValue = show <<< renderOrderedListType

instance isPropPreloadValue :: IsHtmlProp PreloadValue where
  toHtmlPropValue = show <<< renderPreloadValue

instance isPropScopeValue :: IsHtmlProp ScopeValue where
  toHtmlPropValue = show <<< renderScopeValue

instance isPropStepValue :: IsHtmlProp StepValue where
  toHtmlPropValue = show <<< renderStepValue

instance isPropWrapValue :: IsHtmlProp WrapValue where
  toHtmlPropValue = show <<< renderWrapValue

instance isPropInputAcceptType :: IsHtmlProp InputAcceptType where
  toHtmlPropValue = show <<< renderInputAcceptType
