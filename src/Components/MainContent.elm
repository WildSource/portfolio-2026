module Components.MainContent exposing (element)

import Element exposing (Element)
import Message exposing (Msg)
import Model exposing (Model)
import Translation exposing (Language (..))

import Components.Card as Card
import Translation as T

element : Model -> Element Msg
element model =
    let
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
                    
        technologyContent =
            Element.paragraph
                []
                [ Element.column []
                      [ Element.text "Haskell"
                      , Element.text "Java"
                      , Element.text "Elm"
                      , Element.text "Javascript"
                      , Element.text "Typescript"
                      , Element.text "Php"
                      ]
                , Element.column []
                      [ Element.text "Spring Boot"
                      , Element.text "React"
                      , Element.text "Angular"
                      , Element.text "Elm"
                      , Element.text "Scotty"
                      , Element.text "Servant"
                      ]
                ]
                
        projectsContent =
            Element.paragraph
                []
                [ Element.column
                      []
                      [ Element.text "Adult Webcomic Website"
                      , Element.text "Portfolio (2023)"
                      ]
                ]      
    in
        Element.column
            [ Element.centerX
            , Element.width Element.fill
            , Element.height Element.fill
            , Element.spacing 20
            , Element.paddingXY 0 20
            ]
            [ Card.element model T.aboutTitle aboutContent
            , Card.element model T.experiencesTitle experiencesContent
            , Card.element model T.technologyTitle technologyContent
            , Card.element model T.projectsTitle projectsContent
            ]
        
        
