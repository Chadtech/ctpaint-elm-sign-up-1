module Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


(-) = (,)

viewStyle : Attribute Msg
viewStyle =
  style
  [ "margin"  - "auto"
  , "width"   - "60%"
  , "padding" - "10px"
  ]

headerStyle : Attribute Msg
headerStyle =
  style
  [ "margin"  - "auto"
  , "display" - "block"
  ]

mainBlockStyle : Attribute Msg
mainBlockStyle = 
  style
  [ "margin" - "auto"
  , "width"  - "400px"
  ]

fieldStatus : Status -> String
fieldStatus status =
  case status of
    Fine ->
      ""
    Success ->
      " success"
    Error ->
      " error"
    Invalid ->
      " error"

subscribeButtonStyle : Attribute Msg
subscribeButtonStyle =
  style
  [ "background-color" - "#030907" 
  , "border"           - "none"
  , "outline"          - "none"
  ]

goToAppStyle : Attribute Msg
goToAppStyle =
  style
  [ "margin"     - "auto"
  , "width"      - "90%"
  , "margin-top" - "1em"
  ]

orStyle : Attribute Msg
orStyle =
  style
  [ "width"         - "44px"
  , "margin"        - "0px"
  , "display"       - "inline"
  , "font-size"     - "4em"
  , "margin-right"  - "22px"
  ]

goToCtPaintStyle : Attribute Msg
goToCtPaintStyle =
  style
  [ "background-color" - "#030907"
  , "border"           - "none"
  , "outline"          - "none"
  , "font-size"        - "4em"
  , "display"          - "inline"
  ]