module Test.Templates.PackageVersion where

import Prelude

import Data.Array as Array
import Data.Date (Date)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE
import Test.Templates.Utils (ddItem, ddItem', dlGroupedList, dtTitle, titleItemElems, whenElem)

type Props =
  { deprecated :: Boolean
  , packageName :: String
  , packageVersion :: String
  , versionSelector :: String -> String -> Html
  , linkToGitHub :: String -> Html
  , packageGitHub :: String
  , joinLicenses :: String -> Maybe (Array Html)
  , bowerLicense :: String -> String
  , packageMeta :: String
  , packageUploader :: String
  , linkToGitHubUser :: String -> Html
  , packageTagTime :: Maybe Date
  , formatDate :: Date -> Html
  , renderReadme :: Html
  , moduleList :: Html
  , dependencies :: Array (Tuple String String)
  , isPureScriptPackage :: String -> Boolean
  , routes ::
      { packageName :: String -> String
      }
  }

render :: Props -> Array Html
render props =
  [ HE.div
      [ HA.classes [ "page-title", "clearfix" ] ]
      [ HE.div
          [ HA.class_ "page-title__label" ]
          [ HE.textElem "Package"
          , whenElem props.deprecated \_ ->
              HE.span
                [ HA.class_ "badge--deprecated", HA.title "This package is marked as deprecated" ]
                [ HE.textElem "DEPRECATED" ]
          ]
      , HE.h1
          [ HA.class_ "page-title__title" ]
          [ HE.textElem props.packageName ]
      ]
  , HE.div
      [ HA.classes [ "col", "col--main" ] ]
      [ props.versionSelector props.packageName props.packageVersion
      , dlGroupedList $
          titleItemElems
            (HE.textElem "Repository")
            (props.linkToGitHub props.packageGitHub)
            <>
              ( case props.joinLicenses $ props.bowerLicense props.packageMeta of
                  Nothing -> []
                  Just licenses ->
                    [ dtTitle $ HE.textElem "License"
                    , ddItem' licenses
                    ]
              )
            <> titleItemElems
              (HE.textElem "Uploaded by")
              (props.linkToGitHubUser props.packageUploader)
            <>
              ( case props.packageTagTime of
                  Nothing -> []
                  Just date ->
                    titleItemElems
                      (HE.textElem "Published on")
                      (props.formatDate date)

              )
      , props.renderReadme
      ]
  , HE.div
      [ HA.classes [ "col", "col--aside" ] ]
      [ props.moduleList
      , HE.dl
          [ HA.class_ "grouped-list" ]
          $ Array.cons
              (dtTitle $ HE.textElem "Dependencies")
              if Array.null props.dependencies then
                [ ddItem $ HE.textElem "No dependencies" ]
              else
                props.dependencies <#> \(Tuple depPackage versionRange) ->
                  ddItem'
                    [ HE.div
                        [ HA.class_ "deplink" ]
                        [ HE.a
                            [ HA.class_ "deplink__link"
                            , HA.href $
                                if props.isPureScriptPackage depPackage then
                                  props.routes.packageName depPackage
                                else
                                  "https://libraries.io/bower/" <> depPackage
                            ]
                            [ HE.textElem depPackage ]
                        , HE.span
                            [ HA.class_ "deplink__version" ]
                            [ HE.textElem versionRange ]
                        ]
                    ]
      ]
  ]

