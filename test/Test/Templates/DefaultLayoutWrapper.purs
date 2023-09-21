module Pursuit.Server.Templates.DefaultLayoutWrapper where

import Prelude

import Data.MediaType (MediaType(..))
import Data.MediaType.Common (applicationJavascript, imagePNG, textCSS)
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE

type Props =
  { pageTitle :: String
  , favicon ::
      { appleTouchIconPng :: String
      , favicon32x32Png :: String
      , favicon16x16Png :: String
      , safariPinndTabSvg :: String
      , faviconIco :: String
      , browserConfigXml :: String
      }
  , openSearchDescriptionXml :: String
  , manifestJson :: String
  , css ::
      { normalizeCss :: String
      , pursuitCss :: String
      , extraCss :: String
      }
  , js ::
      { jsCookie :: String
      , pursuit :: String
      }
  , pageHead :: Array Html
  , pageBody :: Array Html
  }

render :: Props -> Html
render props =
  HE.html
    [ HA.lang "en" ]
    [ HE.head_ $
        [ HE.meta [ HA.charset "utf-8" ]
        , HE.meta [ HA.httpEquiv "X-UA-Compatible", HA.content "IE=edge" ]
        , HE.meta [ HA.name "viewport", HA.content "width=device-width, initial-scale=1" ]
        , HE.title_ [ HE.textElem props.pageTitle ]
        -- favicon
        , HE.link [ HA.rel "apple-touch-icon", HA.sizes "180x180", HA.href props.favicon.appleTouchIconPng ]
        , HE.link [ HA.rel "icon", HA.type_ imagePNG, HA.href props.favicon.favicon32x32Png, HA.sizes "32x32" ]
        , HE.link [ HA.rel "icon", HA.type_ imagePNG, HA.href props.favicon.favicon16x16Png, HA.sizes "16x16" ]
        , HE.link [ HA.rel "manifest", HA.href props.manifestJson ]
        , HE.link [ HA.rel "mask-icon", HA.href props.favicon.safariPinndTabSvg, HA.color "#000000" ]
        , HE.link [ HA.rel "shortcut icon", HA.href props.favicon.faviconIco ]
        , HE.meta [ HA.name "apple-mobile-web-app-title", HA.content "Pursuit" ]
        , HE.meta [ HA.name "application-name", HA.content "Pursuit" ]
        , HE.meta [ HA.name "msapplication-config", HA.content props.favicon.browserConfigXml ]
        , HE.meta [ HA.name "theme-color", HA.content "#000000" ]
        -- search
        , HE.link [ HA.rel "search", HA.href props.openSearchDescriptionXml, HA.type_ $ MediaType "application/opensearchdescription+xml", HA.title "Pursuit" ]
        -- CSS/JS
        , HE.link [ HA.href "https://fonts.googleapis.com/css?family=Roboto+Mono|Roboto:300,400,400i,700,700i", HA.type_ textCSS, HA.rel "stylesheet" ]
        , HE.link [ HA.href props.css.normalizeCss, HA.type_ textCSS, HA.rel "stylesheet" ]
        , HE.link [ HA.href props.css.pursuitCss, HA.type_ textCSS, HA.rel "stylesheet" ]
        , HE.link [ HA.href props.css.extraCss, HA.type_ textCSS, HA.rel "stylesheet" ]
        , HE.script [ HA.type_ applicationJavascript, HA.src props.js.jsCookie ] []
        , HE.script [ HA.type_ applicationJavascript, HA.src props.js.pursuit ] []
        ] <> props.pageHead
    , HE.body_
        props.pageBody
    ]
