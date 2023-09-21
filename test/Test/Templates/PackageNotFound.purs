module Test.Templates.PackageNotFound where

import Prelude

import Data.Array as Array
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE

type Props =
  { packageName :: String
  , compilerVersionSeries :: String
  }

render :: Props -> Array Html
render props =
  [ HE.h2_
      [ HE.textElem "Package not found" ]
  , HE.p_
      [ HE.textElem "No package named "
      , HE.style_ [ HE.textElem props.packageName ]
      , HE.textElem $ Array.fold
          [ " exists in the database. It might not have been published "
          , "to Pursuit as of the currently active version series of the "
          , "PureScript compiler (namely, " <> props.compilerVersionSeries
          ]
      ]
  ]
