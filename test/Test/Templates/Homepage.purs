module Test.Templates.Homepage where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe)
import Data.Tuple (Tuple(..))
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (Html)
import RenderXml.Html.Elements as HE
import Test.Templates.Utils (ddItem', dlGroupedList, dtTitle, maybeElem)

type Props =
  { latest :: Array (Tuple String String)
  , packageNamesByLetter :: Array (Array String)
  , firstLetter :: String -> Maybe String
  , routes ::
      { package :: String -> String
      , packageVersion :: String -> String -> String
      , prim :: String
      , help :: String
      }
  , packageNames :: Array String
  }

render :: Props -> Array Html
render props =
  [ HE.div
      [ HA.class_ "col" ]
      [ HE.h1_
          [ HE.strong_ [ HE.textElem "Pursuit" ]
          , HE.textElem " is the home of PureScript documentation"
          ]
      ]
  , HE.div
      [ HA.classes [ "col", "col--main" ] ]
      [ HE.p_
          [ HE.textElem "Pursuit hosts API documentation for "
          , HE.a
              [ HA.href "https://www.purescript.org/" ]
              [ HE.textElem "PureScript" ]
          , HE.textElem $
              " packages. It lets you search by package, module, \
              \and function names, as well as approximate type signatures."
          ]
      , HE.p_
          [ HE.textElem "To get started, have a lok around "
          , HE.a
              [ HA.href props.routes.prim ]
              [ HE.textElem "Prim" ]
          , HE.textElem ", the "
          , HE.a
              [ HA.href "/packages/purescript-prelude" ]
              [ HE.textElem "Prelude" ]
          , HE.textElem ", or try one of these example searches:"
          ]
      , HE.ul
          [ HA.class_ "ul--search" ]
          renderSampleSearchLiItems
      ]
  , HE.div
      [ HA.classes [ "col", "col--aside" ] ]
      [ HE.dl
          [ HA.class_ "grouped-list", HA.style "margin-top: 0.6em" ]
          [ dtTitle $ HE.textElem "Publish"
          , ddItem'
              [ HE.textElem $
                  "If you are a package author looking for information on how to \
                  \publish your packages on Pursuit, see the "
              , HE.a
                  [ HA.href props.routes.help ]
                  [ HE.textElem "Help page" ]
              , HE.textElem "."
              ]
          ]
      , dlGroupedList
          [ dtTitle $ HE.textElem "Contribute"
          , ddItem'
              [ HE.textElem $
                  "Pursuit is free and open-source software, and the code \
                  \is hosted on GitHub. Contributions are welcome: "
              , HE.a
                  [ HA.href "https://github.com/purescript/pursuit" ]
                  [ HE.textElem "https://github.com/purescript/pursuit" ]
              , HE.textElem "."
              ]
          ]
      ]
  , HE.div
      [ HA.class_ "clear-float" ]
      [ HE.h2_
          [ HE.textElem "Package Index" ]
      , if (Array.null props.packageNames) then
          HE.p_
            [ HE.textElem "No packages uploaded yet." ]
        else
          HE.div
            [ HA.classes [ "multi-col", "clearfix" ], HA.style "margin-top: -2.441em" ]
            $ Array.cons renderLatestUploads renderPackagesByLetter
      ]
  ]
  where
  renderLatestUploads =
    HE.div
      [ HA.class_ "multi-col__col" ]
      [ HE.h3_
          [ HE.textElem "Latest uploads" ]
      , HE.ul_ $ props.latest <#> \(Tuple packageName version) ->
          HE.li_
            [ HE.div
                [ HA.class_ "deplink" ]
                [ HE.a
                    [ HA.class_ "deplink__link", HA.href $ props.routes.packageVersion packageName version ]
                    [ HE.textElem packageName ]
                , HE.span
                    [ HA.class_ "deplink__version" ]
                    [ HE.textElem version ]
                ]
            ]

      ]
  renderPackagesByLetter = props.packageNamesByLetter <#> \packages ->
    HE.div
      [ HA.class_ "multi-col__col" ]
      [ (Array.head packages >>= props.firstLetter) # maybeElem \letter ->
          HE.h3_ [ HE.textElem letter ]
      , HE.ul_ $ packages <#> \packageName ->
          HE.li_
            [ HE.a
                [ HA.href $ props.routes.package packageName ]
                [ HE.textElem packageName ]
            ]
      ]
  renderSampleSearchLiItems = sampleSearches <#> \(Tuple route text) ->
    HE.li_
      [ HE.a
          [ HA.href route ]
          [ HE.textElem text ]
      ]
    where
    sampleSearches =
      [ Tuple "/search?q=map" "map"
      , Tuple "/search?q=%28a+->+b%29+->+f+a+->+f+b" "(a -> b) -> f a -> f b"
      , Tuple "/search?q=Data.List" "Data.List"
      ]
