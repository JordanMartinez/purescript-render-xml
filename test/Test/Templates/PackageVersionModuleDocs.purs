module Test.Templates.PackageVersionModuleDocs where

import Prelude

import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE
import Test.Templates.Utils (ddItem', dlGroupedList, dtTitle, whenElem)

type Props =
  { insertBreaks :: String -> String
  , moduleName :: String
  , packageName :: String
  , packageVersion :: String
  , versionSelector :: String -> String -> Html
  , routes ::
      { package :: String -> String }
  , deprecated :: Boolean
  , htmlDocs :: Html
  , moduleList :: Array Html
  }

render :: Props -> Array Html
render props =
  [ HE.div
      [ HA.classes [ "page-title", "clearfix" ] ]
      [ HE.div
          [ HA.class_ "page-title__label" ]
          [ HE.textElem "Module" ]
      , HE.h1
          [ HA.class_ "page-title__title" ]
          [ HE.textElem $ props.insertBreaks props.moduleName ]
      ]
  , HE.div
      [ HA.classes [ "col", "col--main" ] ]
      [ props.versionSelector props.packageName props.packageVersion
      , dlGroupedList
          [ dtTitle $ HE.textElem "Package"
          , ddItem'
              [ HE.a
                  [ HA.href $ props.routes.package props.packageName ]
                  [ HE.textElem props.packageName ]
              , whenElem props.deprecated \_ ->
                  HE.span
                    [ HA.class_ "badge--deprecated"
                    , HA.title "This package is marked as deprecated"
                    ]
                    [ HE.textElem "DEPRECATED" ]
              ]
          ]
      , props.htmlDocs
      ]
  , HE.div
      [ HA.classes [ "col", "col--aside" ] ]
      props.moduleList
  ]
