module Components.Patterns.Slider exposing (element)

import Component

import Data.Message exposing (Msg)
import Element exposing (Element)
import Theme exposing (Theme (..))

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Background as Background
import Element.Border as Border

element : Theme -> Bool -> Element Msg
element theme isSwitchedOn =
    let
        knobColor =
            case theme of
                Dark  -> GDark.fg


                Light -> GLight.fg
                    
        knobPosition =
            if isSwitchedOn then
                Element.moveLeft 5                
            else
                Element.moveRight 5

        defaultKnobAttributes =
            [ Border.rounded 20
            , Background.color knobColor
            , Element.centerY
            , Element.width (Element.px 20)
            , Element.height (Element.px 20)
            , knobPosition
            ]

        knobAttributes =
            if isSwitchedOn then
                Element.alignRight :: defaultKnobAttributes
            else
                defaultKnobAttributes
            
        knob =
            Element.el knobAttributes
                (Element.none)
    in
        Element.el
            [ Border.rounded 15
            , Background.color GLight.grayLight
            , Element.moveRight 5
            , Element.width (Element.px 50)
            , Element.height (Element.px 30)            
            , Element.inFront knob              
            ]
        (Element.none)            
