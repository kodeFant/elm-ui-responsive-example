module View exposing (content, footer, header, menu, related, view)

import Colors exposing (deepskyblue, gold, hotpink, lightgreen, tomato)
import Element
    exposing
        ( Attribute
        , DeviceClass(..)
        , Element
        , Orientation(..)
        , column
        , el
        , fill
        , fillPortion
        , height
        , layout
        , padding
        , paragraph
        , row
        , text
        , width
        )
import Element.Background as Background
import Element.Region as Region
import Html exposing (Html)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    let
        responsiveLayout =
            case ( model.class, model.orientation ) of
                ( Phone, _ ) ->
                    phoneLayout

                ( Tablet, _ ) ->
                    tabletLayout

                ( Desktop, Portrait ) ->
                    tabletLayout

                ( Desktop, _ ) ->
                    desktopLayout

                ( BigDesktop, _ ) ->
                    bigDesktopLayout
    in
    layout [ height fill, width fill ] responsiveLayout



-- LAYOUTS


phoneLayout : Element Msg
phoneLayout =
    column [ height fill, width fill ]
        [ header []
        , content []
        , menu []
        , related []
        , footer []
        ]


tabletLayout : Element Msg
tabletLayout =
    column [ height fill, width fill ]
        [ header []
        , content []
        , row [ width fill ]
            [ menu []
            , related []
            ]
        , footer []
        ]


desktopLayout : Element Msg
desktopLayout =
    column [ height fill, width fill ]
        [ header []
        , row [ height fill ]
            [ menu [ width (fillPortion 1), height fill ]
            , content [ width (fillPortion 3), height fill ]
            , related [ width (fillPortion 1), height fill ]
            ]
        , footer []
        ]


bigDesktopLayout : Element Msg
bigDesktopLayout =
    desktopLayout



-- ELEMENTS


header : List (Attribute Msg) -> Element Msg
header attr =
    el
        ([ Background.color tomato
         , padding 15
         , width fill
         ]
            ++ attr
        )
        (text "Header")


menu : List (Attribute Msg) -> Element Msg
menu attr =
    el
        ([ Background.color gold
         , padding 15
         , width fill
         , Region.navigation
         ]
            ++ attr
        )
        (text "Menu")


content : List (Attribute Msg) -> Element Msg
content attr =
    el
        ([ Background.color deepskyblue
         , padding 15
         , width fill
         , height fill
         , Region.mainContent
         ]
            ++ attr
        )
    <|
        paragraph
            []
            [ el [] (text "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.") ]


related : List (Attribute Msg) -> Element Msg
related attr =
    el
        ([ Background.color hotpink
         , padding 15
         , width fill
         , Region.aside
         ]
            ++ attr
        )
        (text "Related content")


footer : List (Attribute Msg) -> Element Msg
footer attr =
    el
        ([ Background.color lightgreen
         , padding 15
         , width fill
         , Region.footer
         ]
            ++ attr
        )
        (text "Footer")
