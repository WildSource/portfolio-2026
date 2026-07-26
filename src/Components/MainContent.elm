module Components.MainContent exposing (element)

import Element exposing
    ( Element
    , fill
    )
import Data.Message exposing (Msg)
import Data.Model exposing (Skill)
import Utils exposing (debugBorder)
import Theme exposing
    ( Theme (..)
    , evalTheme
    ) 

import Components.Card as Card
import Components.Dropdown as Dropdown
import Components.Highlight as Highlight
import Data.Translation as T
import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Data.Model as M

element : Theme -> T.Language -> List Skill -> List String -> Element Msg
element theme language skills dropdowns =
    let
        fontColor =
            if theme == Light then
                GLight.fg0
            else
                GDark.fg0                    

        projectsContent =
            Element.column
                [ Element.width fill
                , Element.spacing 10
                ]
                [ Dropdown.element
                    theme
                    dropdowns                      
                    "Adult Webcomic Website"
                , Dropdown.element
                    theme
                    dropdowns
                    "Portfolio (2023)"
                , Dropdown.element
                    theme
                    dropdowns
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
            [ Card.element
                  theme
                  language
                  T.aboutTitle (aboutContent language)
            , Card.element
                  theme
                  language
                  T.experiencesTitle (experiencesContent theme language)
            , Card.element
                  theme
                  language
                  T.technologyTitle (technologyContent theme skills)
            , Card.element
                  theme
                  language
                  T.projectsTitle projectsContent
            ]

aboutContent : T.Language -> Element Msg
aboutContent language =
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
                     if language == T.EN then
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

                
technologyContent : Theme -> List Skill -> Element Msg
technologyContent theme skills =
    let
        subTitleStyle =
            [ Element.padding 10
            , Font.size 20
            , Font.color
                  ( evalTheme
                       GDark.greenLight
                       (Light, GLight.greenDark)
                       theme
                  )
            ]            
            
        sectionStyle =
            [ Element.spacing 10
            , Element.paddingXY 0 10
            , Element.centerX
            , Element.width fill
            ]

        contentStyle =
            [ Element.padding 10
            , Element.spacing 10
            , Element.width fill
            ]

        programmingLanguages : List (Element Msg)
        programmingLanguages =
            List.map
                (Highlight.element theme) 
                (List.filter
                     (\ skill -> skill.category == M.Language)
                     skills
                |>
                  List.map
                     (\ skill -> skill.title)
                )

        librariesAndFrameworks : List (Element Msg)
        librariesAndFrameworks =
            List.map
                (Highlight.element theme)
                (List.filter
                     (\ skill -> skill.category == M.LibraryFramework)
                     skills
                |>
                  List.map
                     (\ skill -> skill.title)
                )
                
        languageSection =
            Element.column
                sectionStyle
                [ Element.el
                      subTitleStyle
                      (Element.text "Programming Languages")

                , Element.paragraph
                    (debugBorder contentStyle)
                    programmingLanguages                        
                ]
                
                
        libraryFrameworkSection =
            Element.column
                sectionStyle
                [ Element.el
                      subTitleStyle
                      (Element.text "Libraries and/or Frameworks")
                , Element.paragraph
                      (debugBorder contentStyle)
                      librariesAndFrameworks
                ]
    in
        Element.paragraph
            (debugBorder [Element.width fill])
            [ languageSection
            , libraryFrameworkSection
            ]
        

experiencesContent : Theme -> T.Language -> Element Msg
experiencesContent theme language  =   
    let
        titleTranslation =
            { en = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Internship (2023-2026)\n"
            , fr = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Stage (2023-2026)\n"
            }
            
        titleText =
            if language == T.EN then
                titleTranslation.en
            else
                titleTranslation.fr

        titleColor =
            if theme == Light then
                GLight.greenDark
            else
                GDark.greenLight

        p1Translated =
            if language == T.EN then
                T.experienceContentP1.en
            else
                T.experienceContentP1.fr

        p2Translated =
            if language == T.EN then
                T.experienceContentP2.en
            else
                T.experienceContentP2.fr

        p3Translated =
            if language == T.EN then
                T.experienceContentP3.en
            else
                T.experienceContentP3.fr

        p4Translated =
            if language == T.EN then
                T.experienceContentP4.en
            else
                T.experienceContentP4.fr

        p5Translated =
            if language == T.EN then
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
            

