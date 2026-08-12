module Components.BackToTopButton exposing (element)

import Icons

import Element exposing
    ( Element
    , Device
    , px
    )
import Data.Message exposing (Msg)
import Theme exposing (Theme (..))

import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Themes.GruvboxDark as GDark
import Themes.GruvboxLight as GLight


element : { r | theme : Theme , device : Device } -> Element Msg
element ({ theme, device } as config) =
    let
        responsiveSize =
            case device.class of
                _ -> px 50

        themeColor =
            case theme of
                Light -> GLight.fg2

                         
                Dark -> GDark.fg2
    in
        Input.button
            [ Element.width responsiveSize
            , Element.height responsiveSize
            , Border.width 2
            , Border.rounded 50
            , Border.color GLight.orangeLight
            , Background.color themeColor
            ]
            { onPress = Nothing
            , label = Icons.chevron config True
            }
            
