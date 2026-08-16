module Components.MainContent exposing (element)

import Utils exposing (getNameFromLink)

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
    , DeviceClass (..)
    , fill
    , width
    , height
    , padding
    , paddingXY
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
        responsivePadding =
            case device.class of
                Desktop -> padding 80

                           
                BigDesktop -> padding 150

                              
                _ -> padding 10

        responsiveSpacing =
            case device.class of
                Desktop -> spacing 50

                           
                BigDesktop -> spacing 80

                              
                _ -> spacing 20
                     
        fontColor =
            case theme of
                Dark  -> GDark.fg0

                         
                Light -> GLight.fg0

        projectDropdowns : Theme -> List (Element Msg)
        projectDropdowns siteTheme =            
            List.map
                (\ ({ title, link } as project) ->
                     let
                         isToggled = List.member title.en dropdowns
                         linkElement =
                             Maybe.map
                                 (\ linkStr ->
                                      let
                                          linkLabel =
                                              case getNameFromLink linkStr of
                                                  Nothing -> ""

                                      
                                                  Just siteName -> siteName
                                      in
                                      Element.link
                                          [ paddingXY 10 0
                                          , Font.color
                                              (case siteTheme of
                                                   Light -> GLight.blueDark


                                                   Dark -> GDark.blueLight
                                              )
                                          , Font.underline
                                          ]
                                          { url = linkStr
                                          , label = Element.text linkLabel
                                          }
                                 )
                                 link
                     in
                         Dropdown.element config project linkElement isToggled
                )
                projects

        projectsContent =
            Element.column
                [ width fill
                , spacing 20
                ]
                (projectDropdowns theme)

        content =
            let                         
                curriedComponents =
                    List.map (Card.element config) titles

                contentTexts =
                    [ aboutContent language about
                    , experiencesContent theme language experience.title experience.body
                    , technologyContent config skills
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
            , responsivePadding
            , responsiveSpacing
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

                
technologyContent : Config -> List Skill -> Element Msg
technologyContent { theme, language, device } skills =
    let
        responsiveSubTitleFontSize =
            case device.class of
                Desktop -> 30

                           
                BigDesktop -> 50

                              
                _ -> 20
            
        subTitleStyle =
            [ padding 10
            , Font.size responsiveSubTitleFontSize
            , Font.color
                  ( case theme of
                        Dark  -> GDark.greenLight


                        Light -> GLight.greenDark
                  )
            ]                       

        contentStyle =
            [ width fill
            , padding 5
            , spacing 15
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

        languageSubtitle =
            T.translate language T.languageSectionSubtitle

        languageSection =
            Element.column [ spacing 10 ]
                [ Element.el subTitleStyle
                      (Element.text languageSubtitle)

                , Element.wrappedRow contentStyle
                    programmingLanguages                        
                ]

        libraryFrameworkSubtitle =
            T.translate language T.librariesFrameworkSubtitle
                
        libraryFrameworkSection =
            Element.column [ spacing 10 ]
                [ Element.el subTitleStyle
                      (Element.text libraryFrameworkSubtitle)
                , Element.wrappedRow contentStyle
                      librariesAndFrameworks
                ]
    in
        Element.column
            [ padding 5
            , spacing 20
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
            

