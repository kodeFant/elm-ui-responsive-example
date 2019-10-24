-- VIEW


module View exposing (content, footer, header, menu, related, view)

import Element exposing (..)
import Html exposing (Html)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    let
        responsiveLayout =
            column []
                [ header
                , content
                , menu
                , related
                , footer
                ]
    in
    layout [] responsiveLayout


header : Element Msg
header =
    el [] (text "Header")


menu : Element Msg
menu =
    el [] (text "Meny")


content : Element Msg
content =
    el [] (text "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n")


related : Element Msg
related =
    el [] (text "Related")


footer : Element Msg
footer =
    el [] (text "Footer")
