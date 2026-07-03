module Components.Card exposing (element)

import Message exposing (Msg)
import Model exposing (Model)
import Translation exposing
    ( Translation
    , Language (..)
    )
import Element exposing
    ( Element
    , fill
    )

import Element.Border as Border

type alias Title = Translation
type alias Content = Translation
    

element : Model -> Title -> Content -> Element Msg    
element model title content =
    let
        titleText =
            let
                text =
                    if model.locale == EN then
                        title.en
                    else
                        title.fr
            in
                Element.el [] (Element.text text)

        contentText =
            let
                text =
                    if model.locale == EN then
                        content.en
                    else
                        content.fr
            in
                Element.paragraph
                    []
                    [Element.text text]
    in
        Element.column
            [ Border.width 1
            , Element.padding 20
            , Element.spacing 10
            , Element.width fill
            ]
            [ titleText
            , contentText
            ]
    
