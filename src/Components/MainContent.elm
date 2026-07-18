module Components.MainContent exposing (element)

import Element exposing
    ( Element
    , fill
    )
import Message exposing (Msg)
import Model exposing
    ( Model
    , SkillCategory (..)
    )
import Translation exposing (Language (..))
import Theme exposing (Theme (..)) 

import Components.Card as Card
import Components.Dropdown as Dropdown
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

        projectsContent =
            Element.column
                [ Element.width fill
                , Element.spacing 10
                ]
                [ Dropdown.element
                      model
                      "Adult Webcomic Website"
                , Dropdown.element
                      model
                      "Portfolio (2023)"
                , Dropdown.element
                      model
                      "La Voûte"
                ]
    in
        Element.column
            [ Element.centerX
            , Element.width Element.fill
            , Element.height Element.fill
            , Element.paddingXY 0 5
            , Font.size 15
            , Font.color fontColor
            , Font.family
                [ Font.serif                 
                ]                
            ]
            [ Card.element model T.aboutTitle (aboutContent model)
            , Card.element model T.experiencesTitle (experiencesContent model)
            , Card.element model T.technologyTitle (technologyContent model)
            , Card.element model T.projectsTitle projectsContent
            ]

aboutContent : Model -> Element Msg
aboutContent model =
    let
        translations =
            [ T.aboutContent1
            , T.aboutContent2
            , T.aboutContent3
            , T.aboutContent4
            ]

        content =
            translations
            |> List.map
               ( \ translation ->
                     if model.locale == EN then
                         translation.en
                     else
                         translation.fr
               )
            |> List.map Element.text
    in
        Element.paragraph
            []
            [ Element.column
                  [Element.spacing 10]
                  content
            ]

                
technologyContent : Model -> Element Msg
technologyContent model =
    let
        subTitleColor =
            if model.theme == Light then
                GLight.greenDark
            else
                GDark.greenLight
            
        subTitleStyle =
            [ Element.padding 10
            , Font.size 20
            , Font.color subTitleColor
            ]            
            
        sectionStyle =
            [ Element.spacing 10
            , Element.paddingXY 0 10
            , Element.centerX
            ]

        programmingLanguages : List (Element Msg)
        programmingLanguages =
            List.map
                (Element.text) 
                (List.filter
                     (\ skill -> skill.category == Language)
                     model.skills
                |>
                  List.map
                     (\ skill -> skill.title)
                )

        librariesAndFrameworks : List (Element Msg)
        librariesAndFrameworks =
            List.map
                (Element.text)
                (List.filter
                     (\ skill -> skill.category == LibraryFramework)
                     model.skills
                |>
                  List.map
                     (\ skill -> skill.title)
                )
                
        languageSection =
            Element.column
                sectionStyle
                ( Element.el
                      subTitleStyle
                      (Element.text "Programming Languages")
                :: programmingLanguages
                )
                
                
        libraryFrameworkSection =
            Element.column
                sectionStyle
                ( Element.el
                      subTitleStyle
                      (Element.text "Libraries and/or Frameworks")
                :: librariesAndFrameworks
                )
    in
        Element.paragraph
            []
        [ languageSection
        , libraryFrameworkSection
        ]
        

experiencesContent : Model -> Element Msg
experiencesContent model =
    let
        titleTranslation =
            { en = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Internship (2023-2026)\n"
            , fr = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Stage (2023-2026)\n"
            }
            
        titleText =
            if model.locale == EN then
                titleTranslation.en
            else
                titleTranslation.fr

        titleColor =
            if model.theme == Light then
                GLight.greenDark
            else
                GDark.greenLight

        p1Translated =
            if model.locale == EN then
                T.experienceContentP1.en
            else
                T.experienceContentP1.fr

        p2Translated =
            if model.locale == EN then
                T.experienceContentP2.en
            else
                T.experienceContentP2.fr

        p3Translated =
            if model.locale == EN then
                T.experienceContentP3.en
            else
                T.experienceContentP3.fr

        p4Translated =
            if model.locale == EN then
                T.experienceContentP4.en
            else
                T.experienceContentP4.fr

        p5Translated =
            if model.locale == EN then
                T.experienceContentP5.en
            else
                T.experienceContentP5.fr                                                            
    in
        Element.paragraph
            []
            [ Element.column
                  [ Element.spacing 10 ]
                  [ Element.el
                        [ Font.semiBold
                        , Font.color titleColor
                        ]
                        (Element.text titleText)
                  , Element.text p1Translated
                  , Element.text p2Translated
                  , Element.text p3Translated
                  , Element.text p4Translated
                  , Element.text p5Translated
                  ]
            ]                     
            
            
