module Components.Dropdown exposing (element)

import Element exposing
    ( Element
    , fill
    , px
    )
import Message exposing (Msg)
import Model exposing (Model)
import Theme exposing (Theme (..))

import Element.Border as Border
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


iconsPath : String
iconsPath =
    "/assets/icons/"


element : Model -> String -> String -> Bool -> Element Msg
element model title content toggled =
    let
        borderColor =
            if model.theme == Light then
                GLight.aquaDark
            else
                GDark.aquaLight

        chevron =
            if toggled then
                { src = iconsPath ++ "chevron-down-svgrepo-com.svg"
                , description = "chevron down"
                }
            else
                { src = iconsPath ++ "chevron-up-svgrepo-com.svg"
                , description = "chevron up"
                }
    in
        Element.el
            [ Element.padding 10
            , Element.width fill
            , Border.width 1
            , Border.color borderColor
            ]
            (Element.row
                 [ Element.padding 5
                 , Element.spaceEvenly
                 ]
                 [ Element.text (title)
                 , Element.image
                       [ Element.width (px 15)
                       , Element.height (px 15)
                       ]
                       chevron
                 ]
            )
            
