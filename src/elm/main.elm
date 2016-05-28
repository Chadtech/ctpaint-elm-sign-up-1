import Html             exposing (p, text)
import Html.Attributes  exposing (class)
import Html.App         as App
import Types            exposing (..)
import Ports            exposing (..)
import View             exposing (view)
import Debug

main =
  App.program
  { init          = (Model "" False Fine, Cmd.none) 
  , view          = view
  , update        = update
  , subscriptions = subscriptions
  }

subscriptions : Model -> Sub Msg
subscriptions model =
  response HandleResponse

toSubcribe : Model -> (Model, Cmd Msg)
toSubcribe m =
  if m.done then (m, Cmd.none)
  else
    (,)
      {m | 
        field = "subscribing.."
      , done  = True
      }
      <|contactFirebase m.field


update : Msg -> Model -> (Model, Cmd Msg)
update message m =
  case message of 

    UpdateField str ->
      if m.done then 
        (m, Cmd.none)
      else
        ({m | field = str}, Cmd.none)

    CheckForEnter code ->
      if code == 13 then toSubcribe m
      else (m, Cmd.none)

    SubscribePress ->
      toSubcribe m

    HandleResponse str ->
      let
        newStatus = 
          if str == "SUCCESS" then Success
          else 
            if str == "INVALID" then Invalid
            else Error

        field = 
          if str == "SUCCESS" then "Youre subscribed!"
          else 
            if str == "INVALID" then "Hey that email isnt valid."
            else "Sorry! It broke, email me directly."

        done = 
          if str =="SUCCESS" then True
          else
            if str == "ERROR" then True
            else False
      in
        ({m | 
          done   = done, 
          status = newStatus,
          field  = field
        }, Cmd.none)

