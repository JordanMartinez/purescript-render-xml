module Test.Templates.DefaultLayout where

import Prelude

import RenderXml.Html.Attributes (FormMethod(..), InputType(..))
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Attributes.ARIA as HAA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE

type Props =
  { pursuitVersion :: String
  , widget :: Array Html
  , searchText :: String
  , routes ::
      { home :: String
      , help :: String
      , search :: String
      }
  }

render :: Props -> Array Html
render props =
  [ HE.div
      [ HA.class_ "everythiing-except-footer" ]
      [ HE.div
          [ HA.classes [ "top-banner", "clearfix" ] ]
          [ HE.div
              [ HA.classes [ "container", "clearfix" ] ]
              [ HE.a
                  [ HA.class_ "top-banner__logo", HA.href props.routes.home ]
                  [ HE.textElem "Pursuit" ]
              , HE.div
                  [ HA.class_ "top-banner__actions" ]
                  [ HE.div
                      [ HA.class_ "top-banner__actions__item" ]
                      [ HE.a
                          [ HA.href props.routes.help ]
                          [ HE.textElem "Help" ]
                      ]
                  ]
              , HE.form
                  [ HA.class_ "top-banner__form", HAA.role "search", HA.method GET, HA.action props.routes.search ]
                  [ HE.label
                      [ HA.class_ "hide-visually", HA.for "search-input" ]
                      [ HE.textElem "Search for packages, types, and functions" ]
                  , HE.input
                      [ HA.id "search-input"
                      , HA.type_ InputText
                      , HA.name "q"
                      , HA.autofocus -- not sure about this one...
                      , HA.placeholder "Search for packages, types, functions … (S to focus)"
                      , HA.value props.searchText
                      ]
                  ]
              ]
          ]
      , HE.main
          [ HA.classes [ "container", "clearfix" ], HAA.role "main" ]
          [ HE.div
              [ HA.id "message-container" ]
              props.widget
          ]
      ]
  , HE.div
      [ HA.classes [ "container", "clearfix" ] ]
      [ HE.p_
          [ HE.textElem $ "Pursuit v" <> props.pursuitVersion ]
      ]
  ]
