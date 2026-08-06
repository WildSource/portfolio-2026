module Components.Dropdown exposing (element)

import Element exposing
    ( Element
    , DeviceClass (..)
    , width
    , height
    , padding
    , paddingXY
    , fill
    , spaceEvenly
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

        
element : Config -> Project -> Maybe (Element Msg) -> Bool -> Element Msg
element { theme, language, device } { title, description } link isToggled =
    let

        paragraphFontSize =
            case device.class of
                Desktop -> Font.size 20

                           
                BigDesktop -> Font.size 30

                              
                _ -> Font.size 14

        responsivePadding =
            case device.class of
                Desktop -> paddingXY 40 20

                           
                BigDesktop -> paddingXY 80 40

                              
                _ -> paddingXY 10 10
                
            
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
                    translate language description 

                sentences
                    =  String.split "\n" translatedText
                    |> List.map String.trim
                    |> List.filter ((/=) "")
                    |> List.map ((++) "\n")
            in
                List.map (Element.text) sentences

        content =
            if isToggled then
                let
                    bgColor =
                        case theme of
                            Light -> Background.color GLight.bg1
                                     
                            Dark -> Background.color GDark.bg1
                            
                in
                    [ Element.el
                          [ width fill
                          , bgColor
                          , Border.color borderColor
                          , Border.width 1
                          , responsivePadding
                          , paragraphFontSize
                          ]
                          ( Element.paragraph [ padding 5 ]
                                (case link of
                                     Nothing ->
                                         sentenceElements
                                     Just linkElement ->
                                         linkElement :: sentenceElements
                                )
                          )
                    ]
            else
                []
    in
        Element.column [ width fill ]
            ( Input.button
                  ( [ padding 10
                    , width fill
                    , Border.width 3
                    , Border.color borderColor
                    ] ++ buttonColor             
                  )
                  { onPress =
                        Just (Message.ToggleDropdown title.en)
                  , label =
                      Element.row
                        [ padding 10
                        , width fill
                        , spaceEvenly
                        ]
                        [ Element.text (translate language title)
                        , Element.image
                              [ width (px 15)
                              , height (px 15)
                              ]
                              chevron
                        ]
                  }
            :: content 
            )
            
            
