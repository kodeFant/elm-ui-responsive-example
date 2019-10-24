module Main exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)


main : Html msg
main =
    Element.layout
        []
        (text
            "Test"
        )
