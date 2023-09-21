module Test.Templates.Search where

import Prelude

import Data.Array as Array
import Data.Foldable (fold)
import Data.Maybe (Maybe(..))
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE
import Test.Templates.Utils (whenElem)

type Props =
  { results :: Array Unit
  , searchResultHtml :: Unit -> Unit -> Html
  , fr :: Unit
  , urls :: Unit
  , query :: String
  , relatedUrlsNext :: Unit -> Maybe String
  , relatedUrlsPartial :: Unit -> Maybe String
  }

render :: Props -> Html
render props =
  HE.div
    [ HA.classes [ "col", "col--main" ] ]
    [ HE.h1_
        [ HE.textElem "Search results" ]
    , whenElem (Array.null props.results) \_ ->
        HE.div
          [ HA.classes [ "result", "result--empty" ] ]
          [ HE.textElem "Your search for "
          , HE.strong_
              [ HE.textElem props.query ]
          , HE.textElem " did not yield any results."
          ]
    , HE.div
        [ HA.id "results-container" ]
        ( props.results <#> \r ->
            props.searchResultHtml props.fr r
        )
    , whenElem (not $ Array.null props.results) \_ ->
        HE.div
          [ HA.id "load-more"
          , HA.class_ "load-more"
          ]
          [ case props.relatedUrlsNext props.urls of
              Just nextUrl ->
                HE.a
                  [ HA.id "load-more-link", HA.href nextUrl, HA.dataProp "load-more-url" $ fold $ props.relatedUrlsPartial props.urls ]
                  [ HE.textElem "Load more results" ]
              Nothing ->
                HE.p_
                  [ HE.textElem "No further results." ]
          ]
    ]
