module Test.Templates.VersionSelector where

import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE

type Props =
  { versionSelectorIdent :: String
  }

render :: Props -> Html
render props =
  HE.select
    [ HA.id props.versionSelectorIdent
    , HA.class_ "version-selector"
    ]
    [ HE.option
        [ HA.id "placeholder"
        , HA.disabled
        ]
        [ HE.textElem "Loading …" ]
    ]
