module Components.Card exposing (element)

import Data.Model exposing (Config)
import Data.Message exposing (Msg)
import Theme exposing ( Theme (..))
import Data.Translation exposing
    ( Translation
    , translate
    , Language (..)
    )
import Element exposing
    ( Element
    , DeviceClass (..)
    , width
    , spacing
    , fill
    )

import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element
    :  Config
    -> Translation
    -> Element Msg
    -> Element Msg    
element ({ device } as config) title content =
    let
        responsiveFontSize =
            case device.class of
                Desktop -> Font.size 25

                           
                BigDesktop -> Font.size 30

                              
                _ -> Font.size 15
    in
        Element.column
            [ spacing 10
            , width fill
            ]
            [ titleText config title
            , Element.el
                [ responsiveFontSize
                , width fill
                ]
                content
            ]
    
titleText
    :  Config
    -> Translation
    -> Element Msg
titleText { theme, language, device } title =
    let
        text =
            translate
                language
                title
                        
        fontColor =
            case theme of
                Dark -> GDark.blueLight

                        
                Light -> GLight.blueDark

        responsiveFont =
            case device.class of
                Desktop -> Font.size 40

                           
                BigDesktop -> Font.size 80

                              
                _ -> Font.size 20

    in
        Element.el
            [ Font.color fontColor
            , Font.bold
            , responsiveFont
            , Font.family [Font.typeface "Josefin Sans"]
            ]
        (Element.text text)
