module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String as String
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Node.Encoding as Encoding
import Node.FS.Aff as FSA
import RenderXml.Html.Attributes as HA
import RenderXml.Html.Core (renderHtml)
import RenderXml.Html.Elements as HE
import RenderXml.Svg.Attributes as SA
import RenderXml.Svg.Core (renderSvg)
import RenderXml.Svg.Elements as SE
import RenderXml.Svg.Indexed.CSSLength (CSSLength(..))
import RenderXml.Svg.Indexed.Color (Color(..))
import RenderXml.Svg.Indexed.FontSize (FontSize(..))
import RenderXml.Svg.Indexed.Paint (Paint(..))
import RenderXml.Svg.Indexed.TextAnchor (TextAnchor(..))

main :: Effect Unit
main = launchAff_ do
  logHtml
  logSvg

logHtml :: Aff Unit
logHtml = do
  FSA.writeTextFile Encoding.UTF8 "test.html" $ renderHtml $
    HE.div
      [ HA.class_ "foo" ]
      [ HE.span_ [ HE.textElem "bar" ]
      , SE.svg
          [ SA.width 95.0
          , SA.height 20.0
          , SA.xmlnsXLink
          ]
          [ SE.linearGradient
              [ SA.id "smooth"
              , SA.x2 0.0
              , SA.y2Percent 100.0
              ]
              [ SE.stop
                  [ SA.offset 0.0
                  , SA.stopColor $ PaintColor $ Hex "bbb"
                  , SA.stopOpacity 0.1
                  ]
                  []
              , SE.stop
                  [ SA.offset 1.0
                  , SA.stopOpacity 0.1
                  ]
                  []
              ]
          , SE.mask
              [ SA.id "round" ]
              [ SE.rect
                  [ SA.width 95.0
                  , SA.height 20.0
                  , SA.rx 3.0
                  , SA.fill $ PaintColor $ Hex "fff"
                  ]
              ]
          , SE.g
              [ SA.mask "url(round)" ]
              [ SE.rect
                  [ SA.width 49.0
                  , SA.height 20.0
                  , SA.fill $ PaintColor $ Hex "555"
                  ]
              , SE.rect
                  [ SA.x 49.0
                  , SA.width 46.0
                  , SA.height 20.0
                  , SA.fill $ PaintColor $ Hex "4c1"
                  ]
              , SE.rect
                  [ SA.width 95.0
                  , SA.height 20.0
                  , SA.fill $ PaintUrl "#smooth" Nothing
                  ]
              ]
          , SE.g
              [ SA.fill $ PaintColor $ Hex "fff"
              , SA.fontFamily $ String.joinWith "," [ "DejaVu Sans", "Verdana", "Geneva", "sans-serif" ]
              , SA.fontSize $ FontSizeLength $ Px 11.0
              ]
              [ SE.text
                  [ SA.x 25.5
                  , SA.y 15.0
                  , SA.fill $ PaintColor $ Hex "010101"
                  , SA.fillOpacity 0.3
                  , SA.textAnchor AnchorMiddle
                  ]
                  [ SE.textElem "pursuit" ]
              , SE.text
                  [ SA.x 25.5
                  , SA.y 14.0
                  , SA.textAnchor AnchorMiddle
                  ]
                  [ SE.textElem "pursuit" ]
              , SE.text
                  [ SA.x 71.0
                  , SA.y 15.0
                  , SA.fill $ PaintColor $ Hex "010101"
                  , SA.fillOpacity 0.3
                  , SA.textAnchor AnchorMiddle
                  ]
                  [ SE.textElem "v6.0.1" ]
              , SE.text
                  [ SA.x 71.0
                  , SA.y 14.0
                  , SA.textAnchor AnchorMiddle
                  ]
                  [ SE.textElem "v6.0.1" ]
              ]
          ]
      ]

logSvg :: Aff Unit
logSvg = do
  FSA.writeTextFile Encoding.UTF8 "test.svg" $ renderSvg $ SE.svg
    [ SA.width 95.0
    , SA.height 20.0
    , SA.xmlnsXLink
    ]
    [ SE.linearGradient
        [ SA.id "smooth"
        , SA.x2 0.0
        , SA.y2Percent 100.0
        ]
        [ SE.stop
            [ SA.offset 0.0
            , SA.stopColor $ PaintColor $ Hex "bbb"
            , SA.stopOpacity 0.1
            ]
            []
        , SE.stop
            [ SA.offset 1.0
            , SA.stopOpacity 0.1
            ]
            []
        ]
    , SE.mask
        [ SA.id "round" ]
        [ SE.rect
            [ SA.width 95.0
            , SA.height 20.0
            , SA.rx 3.0
            , SA.fill $ PaintColor $ Hex "fff"
            ]
        ]
    , SE.g
        [ SA.mask "url(#round)" ]
        [ SE.rect
            [ SA.width 49.0
            , SA.height 20.0
            , SA.fill $ PaintColor $ Hex "555"
            ]
        , SE.rect
            [ SA.x 49.0
            , SA.width 46.0
            , SA.height 20.0
            , SA.fill $ PaintColor $ Hex "4c1"
            ]
        , SE.rect
            [ SA.width 95.0
            , SA.height 20.0
            , SA.fill $ PaintUrl "#smooth" Nothing
            ]
        ]
    , SE.g
        [ SA.fill $ PaintColor $ Hex "fff"
        , SA.fontFamily $ String.joinWith "," [ "DejaVu Sans", "Verdana", "Geneva", "sans-serif" ]
        , SA.fontSize $ FontSizeLength $ Px 11.0
        ]
        [ SE.text
            [ SA.x 25.5
            , SA.y 15.0
            , SA.fill $ PaintColor $ Hex "010101"
            , SA.fillOpacity 0.3
            , SA.textAnchor AnchorMiddle
            ]
            [ SE.textElem "pursuit" ]
        , SE.text
            [ SA.x 25.5
            , SA.y 14.0
            , SA.textAnchor AnchorMiddle
            ]
            [ SE.textElem "pursuit" ]
        , SE.text
            [ SA.x 71.0
            , SA.y 15.0
            , SA.fill $ PaintColor $ Hex "010101"
            , SA.fillOpacity 0.3
            , SA.textAnchor AnchorMiddle
            ]
            [ SE.textElem "v6.0.1" ]
        , SE.text
            [ SA.x 71.0
            , SA.y 14.0
            , SA.textAnchor AnchorMiddle
            ]
            [ SE.textElem "v6.0.1" ]
        ]
    ]
