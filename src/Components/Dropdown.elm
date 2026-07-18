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
import Element.Font as Font
import Element.Background as Background
import Element.Input as Input
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


iconsPath : String
iconsPath =
    "/assets/icons/"

        
element : Model -> String -> Element Msg
element model skillName =
    let
        isToggled =
            List.member skillName model.toggledDropdowns
            
        borderColor =
            if model.theme == Light then
                GLight.aquaDark
            else
                GDark.aquaLight

        chevron =
            let
                (direction, theme) =
                    case (isToggled, model.theme) of
                        (True, Light) ->
                            ("up", "")
                        (True, Dark) ->
                            ("up", "-dark")
                        (False, Light) ->
                            ("down", "")
                        (False, Dark) ->                        
                            ("down", "-dark")
            in
                { src =
                      iconsPath ++ "chevron-" ++ direction ++ theme ++ "-svgrepo-com.svg"
                , description =
                      "chevron " ++ direction
                }

        buttonColor =
            let
                bgColor =
                    if model.theme == Light then
                        GLight.bg2
                    else
                        GDark.bg0Hard
                            
                shadowColor =
                    if model.theme == Light then
                        GLight.bg4
                    else
                        Element.rgb255 20 20 20
            in
                if isToggled then
                    [ Background.color bgColor
                    , Border.innerShadow
                          { offset = (0, 0)
                          , size = 4
                          , blur = 3
                          , color = shadowColor
                          }
                    ]
                else
                    []

        content =
            if isToggled then                
                [Element.el
                    [ Element.width fill
                    , Border.color borderColor
                    , Border.width 1
                    , Element.padding 10
                    , Font.size 12
                    ]
                (Element.paragraph
                     []
                     [Element.text "Hello Content !"]
                )]
            else
                []
    in
        Element.column
            [ Element.width fill ]
            ( Input.button
                  ( [ Element.padding 10
                    , Element.width fill
                    , Border.width 2
                    , Border.color borderColor
                    ] ++ buttonColor             
                  )
                  { onPress =
                        Just (Message.ToggleDropdown skillName)
                  , label =
                      Element.row
                        [ Element.padding 5
                        , Element.width fill
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
            :: content 
           )
            
            
