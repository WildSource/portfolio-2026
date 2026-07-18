module Component exposing (..)

import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Data.Model exposing (Model)
import Element exposing
    ( Element
    , Attribute
    , DeviceClass (..)
    )

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Background as Background
import Element.Border as Border


-- Conditional styling
addIf : Bool -> Attribute msg -> List (Attribute msg) -> List (Attribute msg)
addIf condition attribute baseAttributes  =
    if condition then
        attribute :: baseAttributes
    else
        baseAttributes

            
debugBorder : List (Attribute msg) -> List (Attribute msg)
debugBorder attributes =
    let
        debugBorderStyle =
            [ Border.width 2
            , Border.color (Element.rgb 1 0 0)
            ]
    in
        attributes ++ debugBorderStyle             
            
            
slider : Model -> Bool -> Element Msg
slider model isSwitchedOn =
    let
        knobColor =
            if model.theme == Light then
                GLight.fg
            else
                GDark.fg
                    
        knobPosition =
            if isSwitchedOn then
                Element.moveLeft 5                
            else
                Element.moveRight 5

        defaultKnobAttributes =
            [ Border.rounded 20
            , Element.centerY
            , knobPosition
            , Element.width (Element.px 20)
            , Element.height (Element.px 20)
            , Background.color knobColor
            ]

        knobAttributes =
            addIf isSwitchedOn Element.alignRight defaultKnobAttributes            
            
        knob =
            Element.el knobAttributes (Element.none)
    in
        Element.el
            [ Border.rounded 15
            , Element.moveRight 5
            , Element.width (Element.px 50)
            , Element.height (Element.px 30)
            , Background.color GLight.grayLight
            , Element.inFront knob              
            ]
        (Element.none)            

        
