module Icons exposing (..)

import Svg exposing (circle)
import Svg.Attributes exposing
    ( width
    , height
    , color
    , fill
    , cx
    , cy
    , r        
    )

import Message exposing (Msg)

import Element exposing (Element)


moon : Element Msg
moon =
    let
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
                  , fill "rgb(251, 241, 199)"
                  ]
                  []
            ]
    in
        Element.html svg

