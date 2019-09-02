module Counter exposing (Model, Msg(..), init, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



--
-- --------    MODEL    --------
--


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )



--
-- --------    UPDATE    --------
--


type Msg
    = Inc
    | Dec


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Inc ->
            ( model + 1, Cmd.none )

        Dec ->
            ( model - 1, Cmd.none )



--
-- --------    VIEW    --------
--


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ p [] [ text <| String.fromInt model ]
        , button [ onClick Inc ] [ text "+" ]
        , button [ onClick Dec ] [ text "-" ]
        ]



--
-- --------    MAIN    --------
--


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "A Counter"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
