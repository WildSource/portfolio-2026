module Icons exposing (..)

import Svg exposing
    ( circle
    , line
    )
import Svg.Attributes exposing
    ( width
    , height
    , fill
    , cx
    , cy
    , r
    , x1
    , x2
    , y1
    , y2
    , stroke
    , strokeWidth
    )

import Data.Message exposing (Msg)

import Element exposing (Element)

import Theme exposing (Theme (..))

import Data.Model exposing (Model)


moon : Model -> Element Msg
moon model =
    let
        illusionColor =
            if model.theme == Light then
                fill "rgb(251, 241, 199)"
            else
                fill "rgb(40, 40, 40)"
        svg =
            Svg.svg
            [ width "30"
            , height "30"
            ]
            [ circle
                  [ cx "15"
                  , cy "15"
                  , r "10"
                  , fill "rgb(124, 111, 100)"                 
                  ]
                  []
            , circle
                  [ cx "5"
                  , cy "15"
                  , r "10"
                  , illusionColor
                  ]
                  []
            ]
    in
        Element.html svg


sun : Element Msg
sun =
    let
        rayTop =
            line
            [ x1 "20"
            , x2 "20"
            , y1 "10"
            , y2 "5"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayTopLeft =
            line
            [ x1 "13"
            , x2 "8"
            , y1 "12"
            , y2 "8"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayTopRight =
            line
            [ x1 "27"
            , x2 "32"
            , y1 "12"
            , y2 "8"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []      

        rayBottom =
            line
            [ x1 "20"
            , x2 "20"
            , y1 "30"
            , y2 "35"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayBottomLeft =
            line
            [ x1 "13"
            , x2 "8"
            , y1 "28"
            , y2 "33"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayBottomRight =
            line
            [ x1 "27"
            , x2 "32"
            , y1 "28"
            , y2 "33"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayLeft =
            line
            [ x1 "10"
            , x2 "5"
            , y1 "20"
            , y2 "20"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []

        rayRight =
            line
            [ x1 "30"
            , x2 "35"
            , y1 "20"
            , y2 "20"
            , stroke "rgb(215, 153, 33)"
            , strokeWidth "2"
            ]
            []   
        
        svg =
            Svg.svg
                [ width "40"
                , height "40"
                ]
                [ circle
                      [ cx "20"
                      , cy "20"
                      , r "8"
                      , fill "rgb(181, 118, 20)"                 
                      ]
                      []
                , rayTop
                , rayTopLeft
                , rayTopRight
                , rayBottom
                , rayBottomLeft
                , rayBottomRight
                , rayLeft
                , rayRight
                ]
    in
        Element.html svg

