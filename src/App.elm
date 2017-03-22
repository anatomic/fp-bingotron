module App exposing (main)

import State
import View
import Types exposing (..)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.root
        }
