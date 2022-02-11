port module Main exposing (main)

import Browser
import Html exposing (Html, div, img)
import Html.Attributes exposing (src, style, id, href)
import Html.Events exposing (..)
import Html exposing (button)



main : Program () () Msg
main =
    Browser.element 
        { init = \_ -> 
            ((), Cmd.none)
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }

type Msg =
    ToggleDialog

update : Msg -> () -> ((), Cmd Msg)
update msg model =
    case msg of
        ToggleDialog ->
            (model, toggleDialog "example-dialog")


view : () -> Html Msg
view _ =
    div []
        [ img [ src "/logo.png", style "width" "300px" ] []
        , div [] 
            [ Html.h1 [] [ Html.text "Elm <dialog> example" ]
            , div [] 
                [ Html.a [ href "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog" ] [ Html.text "Read the MDN documentation on <dialog>" ]
                , Html.text " | "
                , Html.a [ href "https://github.com/lindsaykwardell/elm-dialog-example" ] [ Html.text "Check out the source" ]
                ]
            , dialog "example-dialog"
                [ Html.h2 [] [ Html.text "Hello, Dialog!" ]
                , button [ onClick ToggleDialog ] [ Html.text "Close dialog" ]
                ]
            , button [ onClick ToggleDialog ] [ Html.text "Open the dialog!" ]
            ]
        ]

dialog : String -> List (Html msg) -> Html msg
dialog dialogId content =
    Html.node "dialog" [ id dialogId ] content

port toggleDialog : String -> Cmd msg