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
import Element.Input as Input
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


iconsPath : String
iconsPath =
    "/assets/icons/"


element : Model -> String -> Element Msg
element model skillName =
    let
        borderColor =
            if model.theme == Light then
                GLight.aquaDark
            else
                GDark.aquaLight

        chevron =
            if List.member skillName model.toggledDropdowns then
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
            (Input.button
                 []
                 { onPress =
                       Just (Message.ToggleDropdown skillName)
                 , label =
                     Element.row
                         [ Element.padding 5
                         , Element.spaceEvenly
                         ]
                     [ Element.text (skillName)
                     , Element.image
                           [ Element.width (px 15)
                           , Element.height (px 15)
                           ]
                         chevron
                     ]
                 }
            )
            
