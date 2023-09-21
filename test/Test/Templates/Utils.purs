module Test.Templates.Utils where

import Prelude

import Data.Maybe (Maybe(..))
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE
import RenderXml.Html.Attributes as HA

whenElem :: Boolean -> (Unit -> Html) -> Html
whenElem true h = h unit
whenElem false _ = HE.textElem ""

maybeElem :: forall a. (a -> Html) -> Maybe a -> Html
maybeElem h = case _ of
  Just a -> h a
  Nothing -> HE.textElem ""

dlGroupedList :: Array Html -> Html
dlGroupedList elems =
  HE.dl
    [ HA.class_ "grouped-list" ]
    elems

dtTitle :: Html -> Html
dtTitle title =
  HE.dt
    [ HA.class_ "grouped-list__title" ]
    [ title ]

ddItem :: Html -> Html
ddItem = ddItem' <<< pure

ddItem' :: Array Html -> Html
ddItem' item =
  HE.dd
    [ HA.class_ "grouped-list__item" ]
    item

titleItemElems :: Html -> Html -> Array Html
titleItemElems title item =
  [ dtTitle title
  , ddItem item
  ]
