module RenderXml.Core
  ( Xml
  , DocType(..)
  , render
  , ElemName(..)
  , Namespace(..)
  , Prop
  , AttrName(..)
  , comment
  , textElem
  , node
  , node'
  , transitionNode
  , leaf
  , leaf'
  , transitionLeaf
  , prop
  , prop'
  , attr
  , attr'
  ) where

import Prelude

import Data.Array (fold)
import Data.Array as Array
import Data.Foldable (foldMap)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Safe.Coerce (coerce)

newtype Namespace = Namespace String

derive instance Eq Namespace
derive instance Ord Namespace
derive instance Newtype Namespace _
derive instance Generic Namespace _
instance Show Namespace where
  show (Namespace x) = "(Namespace " <> show x <> ")"

newtype DocType :: Namespace -> Type
newtype DocType nameSpace = DocType String

newtype Xml :: Namespace -> Type
newtype Xml nameSpace = Xml String

type role Xml nominal

render :: forall ns. Maybe (DocType ns) -> Xml ns -> String
render dtd (Xml str) =
  foldMap (\(DocType dtd') -> "<!DOCTYPE " <> dtd' <> ">") dtd
    <> str

newtype ElemName :: Namespace -> Type
newtype ElemName ns = ElemName String

derive instance Eq (ElemName ns)
derive instance Ord (ElemName ns)
derive instance Newtype (ElemName ns) _
derive instance Generic (ElemName ns) _
instance Show (ElemName ns) where
  show (ElemName x) = "(ElemName " <> show x <> ")"

newtype Prop :: Namespace -> Row Type -> Type
newtype Prop ns a = Prop String

type role Prop nominal representational

derive instance Eq (Prop ns a)
derive instance Ord (Prop ns a)

newtype AttrName :: Namespace -> Type
newtype AttrName ns = AttrName String

derive instance Eq (AttrName ns)
derive instance Ord (AttrName ns)
derive instance Newtype (AttrName ns) _
derive instance Generic (AttrName ns) _
instance Show (AttrName ns) where
  show (AttrName x) = "(AttrName " <> show x <> ")"

fromPropArray :: forall ns i. Array (Prop ns i) -> Array String
fromPropArray = coerce

fromXmlArray :: forall ns. Array (Xml ns) -> Array String
fromXmlArray = coerce

comment :: forall ns. String -> Xml ns
comment c = Xml $ "<!-- " <> c <> "-->"

-- | Constructs a text node `Xml` value.
textElem :: forall ns. String -> Xml ns
textElem = Xml

node :: forall ns i. ElemName ns -> Array (Prop ns i) -> Array (Xml ns) -> Xml ns
node = node' Nothing

node' :: forall ns i. Maybe Namespace -> ElemName ns -> Array (Prop ns i) -> Array (Xml ns) -> Xml ns
node' mbNs (ElemName tag) props children = Xml $
  "<" <> tag
    <> foldMap (\(Namespace ns) -> " xlmns=" <> show ns) mbNs
    <> (if Array.null props then "" else append " " $ Array.intercalate " " $ fromPropArray props)
    <> ">"
    <> (fold $ fromXmlArray children)
    <> "</"
    <> tag
    <> ">"

transitionNode
  :: forall outerNs innerNs i
   . Namespace
  -> ElemName innerNs
  -> Array (Prop innerNs i)
  -> Array (Xml innerNs)
  -> Xml outerNs
transitionNode (Namespace ns) (ElemName tag) props children = Xml $
  "<" <> tag
    <> " xlmns="
    <> show ns
    <> (if Array.null props then "" else append " " $ Array.intercalate " " $ fromPropArray props)
    <> ">"
    <> (fold $ fromXmlArray children)
    <> "</"
    <> tag
    <> ">"

leaf :: forall ns i. ElemName ns -> Array (Prop ns i) -> Xml ns
leaf = leaf' Nothing

leaf' :: forall ns i. Maybe Namespace -> ElemName ns -> Array (Prop ns i) -> Xml ns
leaf' mbNs (ElemName tag) props = Xml $
  "<" <> tag
    <> foldMap (\(Namespace ns) -> " xlmns=" <> show ns) mbNs
    <> (if Array.null props then "" else append " " $ Array.intercalate " " $ fromPropArray props)
    <> " />"

transitionLeaf
  :: forall outerNs innerNs i
   . Namespace
  -> ElemName innerNs
  -> Array (Prop innerNs i)
  -> Xml outerNs
transitionLeaf (Namespace ns) (ElemName tag) props = Xml $
  "<" <> tag
    <> " xlmns="
    <> show ns
    <> (if Array.null props then "" else append " " $ Array.intercalate " " $ fromPropArray props)
    <> " />"

prop :: forall ns i. AttrName ns -> String -> Prop ns i
prop = prop' Nothing

prop' :: forall ns i. Maybe Namespace -> AttrName ns -> String -> Prop ns i
prop' mbNs (AttrName name) val =
  Prop $ (foldMap (append ":" <<< unwrap) mbNs) <> name <> "=" <> val

attr :: forall ns i. AttrName ns -> Prop ns i
attr = attr' Nothing

attr' :: forall ns i. Maybe Namespace -> AttrName ns -> Prop ns i
attr' mbNs (AttrName name) =
  Prop $ (foldMap (flip append ":" <<< unwrap) mbNs) <> name

