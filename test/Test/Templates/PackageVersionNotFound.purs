module Test.Templates.PackageVersionNotFound where

import Prelude

import Data.Array as Array
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE

type Props =
  { version :: String
  , packageName :: String
  , availableVersions :: Array String
  , mkPackageVersionRoute :: String -> String -> String
  }

render :: Props -> Array Html
render props =
  [ HE.h2_
      [ HE.textElem "No such version" ]
  , HE.p_
      [ HE.textElem "It seems that the version "
      , HE.strong_ [ HE.textElem props.version ]
      , HE.textElem " of the package "
      , HE.strong_ [ HE.textElem props.packageName ]
      , HE.textElem $ Array.fold
          [ " does not exist, or has not yet been uploaded to Pursuit. "
          , "You may be interested in one of its other versions instead:"
          ]
      ]
  , HE.ul_
      ( props.availableVersions <#> \v ->
          HE.li_
            [ HE.a
                [ HA.href $ props.mkPackageVersionRoute props.packageName v ]
                [ HE.textElem v ]
            ]
      )
  , HE.p_
      [ HE.textElem "If you think this is an error, please let us know by "
      , HE.a
          [ HA.href "https://github.com/purescript/pursuit/issues" ]
          [ HE.textElem "opening an issue" ]
      , HE.textElem ", visiting us on "
      , HE.a
          [ HA.href "https://purescript.org/chat" ]
          [ HE.textElem "the PureScript Discord server" ]
      , HE.textElem ", or "
      , HE.a
          [ HA.href "https://discourse.purescript.org/" ]
          [ HE.textElem "the PureScript Discourse forum" ]
      ]
  ]
