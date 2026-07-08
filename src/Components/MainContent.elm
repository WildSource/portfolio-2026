module Components.MainContent exposing (element)

import Element exposing (Element)
import Message exposing (Msg)
import Model exposing (Model)
import Translation exposing (Language (..))
import Theme exposing (Theme (..))

import Components.Card as Card
import Translation as T
import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

element : Model -> Element Msg
element model =
    let
        fontColor =
            if model.theme == Light then
                GLight.fg0
            else
                GDark.fg0
                    
        aboutContent =
            let
                translation =
                    { en = "Based in Quebec Canada, I have experience in web development"
                    , fr = ""
                    }
                
                contentText =
                    if model.locale == EN then
                        translation.en
                    else
                        translation.fr
            in
                Element.paragraph
                    []
                    [Element.text contentText]

        experiencesContent =
            let
                titleTranslation =
                    { en = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Internship (2023-2026)"
                    , fr = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Stage (2023-2026)"
                    }
                    
                titleText =
                    if model.locale == EN then
                        titleTranslation.en
                    else
                        titleTranslation.fr
            in
                Element.paragraph
                    []
                    [ Element.text titleText
                    ]                     
                
        projectsContent =
            Element.paragraph
                []
                [ Element.column
                      []
                      [ Element.text "Adult Webcomic Website"
                      , Element.text "Portfolio (2023)"
                      , Element.text "La Voûte - "
                      ]
                ]      
    in
        Element.column
            [ Element.centerX
            , Element.width Element.fill
            , Element.height Element.fill
            , Element.spacing 20
            , Element.paddingXY 0 20
            , Font.size 15
            , Font.color fontColor
            , Font.family
                [ Font.serif                 
                ]                
            ]
            [ Card.element model T.aboutTitle aboutContent
            , Card.element model T.experiencesTitle experiencesContent
            , Card.element model T.technologyTitle (technologyContent model)
            , Card.element model T.projectsTitle projectsContent
            ]
        
technologyContent : Model -> Element Msg
technologyContent model =
    let
        languageSection =
            Element.column []
              [ Element.text "Haskell"
              , Element.text "Java"
              , Element.text "Elm"
              , Element.text "Javascript"
              , Element.text "Typescript"
              , Element.text "Php"
              ]
        libraryFrameworkSection =
            Element.column []
            [ Element.text "Spring Boot"
            , Element.text "React"
            , Element.text "Angular"
            , Element.text "Elm"
            , Element.text "Scotty"
            , Element.text "Servant"
            ]
    in
        Element.paragraph
            []
        [ languageSection
        , libraryFrameworkSection
        ]    
        
