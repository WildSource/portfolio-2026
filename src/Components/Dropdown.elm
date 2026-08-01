module Components.Dropdown exposing (element)

import Utils

import Element exposing
    ( Element
    , fill
    , px
    )
import Data.Message exposing (Msg)
import Data.Project exposing (Project)
import Data.Model exposing (Config)
import Theme exposing (Theme (..))
import Data.Translation exposing (translate)

import Data.Message as Message
import Element.Border as Border
import Element.Font as Font
import Element.Background as Background
import Element.Input as Input
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


iconsPath : String
iconsPath =
    "/assets/icons/"

        
element : Config -> Project -> Bool -> Element Msg
element { theme, language } { title, description } isToggled =
    let            
        borderColor =
            case theme of
                Light -> GLight.aquaDark

                Dark -> GDark.aquaLight

        chevron =
            let
                (direction, chevronTheme) =
                    case (isToggled, theme) of
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
                      iconsPath ++ "chevron-" ++ direction ++ chevronTheme ++ "-svgrepo-com.svg"
                , description =
                      "chevron " ++ direction
                }

        buttonColor =
            let
                bgColor =
                    case theme of
                        Light -> GLight.bg2
                                 
                        Dark  -> GDark.bg0Hard
                            
                shadowColor =
                    case theme of
                        Light -> GLight.bg4

                        Dark -> Element.rgb255 20 20 20             
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

        sentenceElements =
            let
                translatedText =
                    translate description language

                sentences
                    =  String.split "\n" translatedText
                    |> List.map String.trim
                    |> List.filter ((/=) "")
                    |> List.map ((++) "\n")
            in
                List.map (Element.text) sentences

        content =
            if isToggled then                
                [ Element.el
                     [ Element.width fill
                     , Border.color borderColor
                     , Border.width 1
                     , Element.padding 10
                     , Font.size 12
                     ]
                     ( Element.paragraph [ Element.padding 5 ]
                          sentenceElements
                     )
                ]
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
                        Just (Message.ToggleDropdown title.en)
                  , label =
                      Element.row
                        [ Element.padding 5
                        , Element.width fill
                        , Element.spaceEvenly
                        ]
                        [ Element.text (translate title language)
                        , Element.image
                              [ Element.width (px 15)
                              , Element.height (px 15)
                              ]
                            chevron
                        ]
                  }
            :: content 
            )
            
            
