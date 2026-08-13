module Components.BackToTopButton exposing (element)

import Icons
import Task

import Element exposing
    ( Element
    , Device
    , px
    )
import Data.Message exposing (Msg)
import Theme exposing (Theme (..))

import Html.Attributes as Attribute
import Browser.Dom as Dom
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Themes.GruvboxDark as GDark
import Themes.GruvboxLight as GLight
import Data.Message as Message


element : { r | theme : Theme , device : Device } -> Element Msg
element ({ theme, device } as config) =
    let
        responsiveSize =
            case device.class of
                _ -> px 60

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
            , Element.htmlAttribute (Attribute.style "position" "fixed")
            , Element.htmlAttribute (Attribute.style "bottom" "50px")
            , Element.htmlAttribute (Attribute.style "right" "50px")
            , Element.htmlAttribute (Attribute.style "z-index" "10")
            ]
            { onPress = Just Message.ScrollToTop
            , label = Icons.chevron config True
            }
            
