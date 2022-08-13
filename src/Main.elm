module Main exposing (Model, Msg, main)

import Browser exposing (Document)
import Html
import Html.Attributes as Attributes
import Html.Events as Events
import Task
import Time exposing (Posix)



-- App


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : ( Model, Cmd Msg )
init =
    ( { posix = 0
      }
    , Cmd.none
    )


type alias Model =
    { posix : Int
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- 娑婆世界で「現在時刻を取得」ボタンを押されたときに
        -- Elm Runtime System が送ってくれる Message
        ClickRequestCurrentTime ->
            ( model
              -- 「現在時刻を娑婆世界で取得してくれ」という指示書
            , Task.perform ReceiveCurrentPosixTime Time.now
            )

        -- 娑婆世界で現在時刻を取得したときに
        -- Elm Runtime Systemが送ってくれる Message
        ReceiveCurrentPosixTime current ->
            -- Elm Runtime System に更新してもらう新しい Model を構築
            -- 元の Model の `posix` フィールドを置き換えた新しい Model を返り値にしている
            ( { model
                | posix = Time.posixToMillis current
              }
            , Cmd.none
            )


view : Model -> Document Msg
view model =
    { title = "Sample App"
    , body =
        [ Html.div
            []
            [ Html.button
                [ Attributes.type_ "button"
                , Events.onClick ClickRequestCurrentTime
                ]
                [ Html.text "現在時刻を取得する"
                ]
            , Html.div
                []
                [ Html.text
                    ("POSIX Time: " ++ String.fromInt model.posix)
                ]
            ]
        ]
    }


type Msg
    = ClickRequestCurrentTime
    | ReceiveCurrentPosixTime Posix
