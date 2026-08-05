module Utils exposing (..)

import Regex

import Regex exposing (Regex)
import Element exposing (Attribute)

import Element.Border as Border


debugBorder : List (Attribute msg) -> List (Attribute msg)
debugBorder attributes =
    let
        debugBorderStyle =
            [ Border.width 2
            , Border.color (Element.rgb 1 0 0)
            ]
    in
        attributes ++ debugBorderStyle

intersperse : a -> List a -> List a
intersperse element elements =
    case (element, elements) of
        ( _, [] ) ->
            []
        (el, (x :: xs)) ->
            x :: el :: intersperse element xs

getNameFromLink : String -> Maybe String
getNameFromLink fullLink =
    let
        siteNameMatcher : Maybe Regex
        siteNameMatcher = Regex.fromString "^https?://([^/]+)"
    in
        siteNameMatcher
        |> Maybe.andThen
           (\ pattern ->
                let
                    matches =
                        Regex.find pattern fullLink
                in
                    if List.length matches == 0 then
                        Nothing
                    else
                        Just matches
           )
        |> Maybe.andThen (\ matches -> List.head matches)
        |> Maybe.andThen (\ match -> Just match.submatches)
        |> Maybe.andThen (\ submatch -> List.head submatch)
        |> Maybe.andThen (\ string -> string)
           
           
           
