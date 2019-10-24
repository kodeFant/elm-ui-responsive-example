module Types exposing (..)

import Element exposing (Device)


type alias Model =
    Device


type alias Flags =
    { height : Int, width : Int }


type Msg
    = SetScreenSize Int Int
