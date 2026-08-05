module Components.MainContent exposing (element)

import Data.Translation exposing
    ( Translation
    , translate
    )
import Theme exposing (Theme (..)) 
import Data.Message exposing (Msg)
import Data.Skill exposing
    ( Skill
    , SkillCategory (..)
    )
import Data.Model exposing
    ( Config
    , Data
    )
import Element exposing
    ( Element
    , fill
    , width
    , height
    , padding
    , spacing
    , centerX
    )

import Components.Card as Card
import Components.Dropdown as Dropdown
import Components.Highlight as Highlight
import Data.Translation as T
import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Config -> Data -> List String -> Element Msg
element ({ theme, language, device } as config) { titles, about, experience, skills, projects } dropdowns =
    let
        fontColor =
            case theme of
                Dark  -> GDark.fg0

                         
                Light -> GLight.fg0

        projectDropdowns : List (Element Msg)
        projectDropdowns =            
            List.map
                (\ ({ title, link } as project) ->
                     let
                         isToggled = List.member title.en dropdowns
                         linkElement =
                             Maybe.map
                                 (\ linkStr ->
                                      Element.link []
                                          { url = linkStr
                                          , label = Element.text ""}
                                 )
                                 link
                     in
                         Dropdown.element config project linkElement isToggled
                )
                projects

        projectsContent =
            Element.column
                [ width fill
                , spacing 10
                ]
                projectDropdowns

        content =
            let                         
                curriedComponents =
                    List.map (Card.element config) titles

                contentTexts =
                    [ aboutContent language about
                    , experiencesContent theme language experience.title experience.body
                    , technologyContent theme skills
                    , projectsContent
                    ]
            in
                List.map2
                    (\ component text -> component text)
                    curriedComponents
                    contentTexts
                    
    in
        Element.column
            [ centerX
            , width fill
            , height fill
            , padding 10
            , spacing 20
            , Font.size 15
            , Font.color fontColor
            , Font.family [ Font.serif ]                
            ]
            content

                
aboutContent : T.Language -> List Translation -> Element Msg
aboutContent language aboutText =
    let
        content = aboutText
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
            [ width fill ]
            [ Element.column [ spacing 10 ]
                  content
            ]

                
technologyContent : Theme -> List Skill -> Element Msg
technologyContent theme skills =
    let
        subTitleStyle =
            [ padding 10
            , Font.size 20
            , Font.color
                  ( case theme of
                        Dark  -> GDark.greenLight


                        Light -> GLight.greenDark
                  )
            ]                       

        contentStyle =
            [ width fill
            , padding 5
            , spacing 5
            ]
            
        programmingLanguages : List (Element Msg)
        programmingLanguages =
            skills
                |> List.filter
                     (\ skill -> skill.category == Language)
                |> List.map
                     (\ skill -> skill.title)
                |> List.map
                     (Highlight.element theme) 


        librariesAndFrameworks : List (Element Msg)
        librariesAndFrameworks =
            skills
                |> List.filter
                     (\ skill -> skill.category == LibraryFramework)
                |> List.map
                     (\ skill -> skill.title)
                |> List.map
                     (Highlight.element theme)

        languageSection =
            Element.column []
                [ Element.el subTitleStyle
                      (Element.text "Programming Languages")

                , Element.wrappedRow contentStyle
                    programmingLanguages                        
                ]
                
        libraryFrameworkSection =
            Element.column []
                [ Element.el subTitleStyle
                      (Element.text "Libraries and/or Frameworks")
                , Element.wrappedRow contentStyle
                      librariesAndFrameworks
                ]
    in
        Element.column
            [ padding 5
            , spacing 5
            ]
            [ languageSection
            , libraryFrameworkSection
            ]
        

experiencesContent
    :  Theme
    -> T.Language
    -> Translation
    -> List Translation
    -> Element Msg
experiencesContent theme language title experienceText =   
    let
        experienceTitle =
            let
                titleText =
                    translate
                        language
                        title
            in
                Element.el
                        [ Font.semiBold
                        , Font.color titleColor
                        ]
                        (Element.text titleText)

        titleColor =
            case theme of
                Dark  -> GDark.greenLight


                Light -> GLight.greenDark

        content =  experienceText
                |> List.map (translate language)
                |> List.map (Element.text)
                         
    in
        Element.paragraph [ width fill ]
            [ Element.column [ spacing 10 ]
                  (experienceTitle :: content)
            ]                     
            

