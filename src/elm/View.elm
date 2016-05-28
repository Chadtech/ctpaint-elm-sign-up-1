module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)
import Json.Decode as Json
import List exposing (append)

(-) = (,)

header : Html Msg
header =
  img
  [ headerStyle
  , src "./ctpaint-logo.png"
  ]
  []

goToApp : Html Msg
goToApp =
  div 
  [ goToAppStyle ]
  [ p
    [ class "point" 
    , orStyle
    ]
    [ text "or" ]
  , a 
    [ goToCtPaintStyle
    , class "point link" 
    , href "http://www.ctpaint.us/app/#no-back-button"
    ] 
    [ text "go to CtPaint" ]
  ]

mainBlock : Model -> Html Msg
mainBlock m =
  div [ mainBlockStyle ]
  [ emailField m
  , subscribeButton
  , p 
    [ class "point ignorable" ]
    [ text "I wont email you much. I wont give your email to anyone else." ] 
  , goToApp
  ]

subscribeButton : Html Msg
subscribeButton =
  button
  [ subscribeButtonStyle
  , class "point link"
  , onClick SubscribePress
  ]
  [ text "subscribe"]

emailField : Model -> Html Msg
emailField m =
  input
  [ class <| "field" ++ (fieldStatus m.status)
  , placeholder "enter your email here"
  , value m.field
  , onInput UpdateField
  , spellcheck False
  , on "keydown" <| Json.map CheckForEnter keyCode
  ]
  []

break : Html Msg
break = br [] []

paragraphs : List (Html Msg)
paragraphs = 
  [ p 
    [ class "point" ] 
    [ text "CtPaint is a simple image editor that runs in your browser. Greatly inspired by MS Paint, its simple, it runs fast, and its the ideal for making pixel art. Its also closely integrated with social media platforms like facebook and twitter. As easily as you can google search an image, you can open it up, edit it, and save it, in CtPaint." ]
  , break
  , p 
    [ class "point" ] 
    [ text "An alpha version of CtPaint already exists for free. Id like to make it into something much greater than what it is today. Enter your email in the field above to keep up to date." ]
  , break
  , p 
    [ class "point veryIgnorable" ]
    [ text "Have something to tell me? Want to get involved? You can email me at CtPaint0@gmail.com" ]
  ]

body : Model -> List (Html Msg)
body m =
  append
  [ header
  , mainBlock m
  , br [] []
  ]
    paragraphs

view : Model -> Html Msg
view m = 
  div 
  [ viewStyle ]
    (body m)
