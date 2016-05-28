port module Ports exposing (..)

import Types exposing (..)

port contactFirebase : String -> Cmd msg

port response : (String -> msg) -> Sub msg