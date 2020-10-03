module Main exposing (main)

import Browser exposing (Document)
import Debug
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events exposing (onInput)



main =
  Browser.document
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }



-- MODEL --

type alias Model =
  { name : String
  , content : String
  }

init : () -> ( Model, Cmd Msg )
init =
  \_ ->
    ( { name = ""
      , content = ""
      }
    , Cmd.none
    )



-- UPDATE --

type Msg
  = FileNameChanged String
  | FileContentChanged String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    FileNameChanged newName ->
      ( { model
        | name =
          Debug.log "FileNameChanged" newName
        }
      , Cmd.none
      )

    FileContentChanged newContent ->
      ( { model
        | content =
          Debug.log "FileContentChanged" newContent
        }
      , Cmd.none
      )



-- VIEW --

view : Model -> Document Msg
view model =
  { title = model.name
  , body =
    [ header
    , content
    ]
  }

header : Html Msg
header =
  Html.header
  []
  [ Html.input
    [ Attr.id "fileName"
    , Attr.type_ "text"
    , Attr.placeholder "File Name Here..."
    , onInput FileNameChanged
    ]
    []
  ]

content : Html Msg
content =
  Html.div
  [ Attr.id "main" ]
  [ Html.textarea
    [ Attr.id "fileContent"
    , Attr.placeholder "Start Writing..."
    , Attr.spellcheck False
    , onInput FileContentChanged
    ]
    []
  ]



-- SUBSCRIPTIONS --

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
