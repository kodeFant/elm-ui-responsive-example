module Main exposing (init, main, subscriptions, update)

import Browser
import Browser.Events as Events

import Element exposing (classifyDevice)
import Types exposing (Flags, Model, Msg(..))
import View exposing (view)



-- MAIN


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( classifyDevice
        { height = flags.height
        , width = flags.width
        }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        SetScreenSize x y ->
            let
                classifiedDevice =
                    classifyDevice
                        { width = x
                        , height = y
                        }
            in
            ( classifiedDevice, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ Events.onResize (\values -> SetScreenSize values) ]
