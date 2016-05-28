module Types exposing (..)

type Msg 
  = UpdateField String
  | SubscribePress
  | HandleResponse String
  | CheckForEnter Int

type Status
  = Fine
  | Success
  | Error
  | Invalid

type alias Model =
  { field  : String 
  , done   : Bool
  , status : Status
  }