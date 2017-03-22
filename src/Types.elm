module Types exposing (..)

import Dict exposing (Dict)
import Set exposing (Set)
import Keyboard
import Random exposing (Generator)
import Navigation


type alias Topic =
    { name : String
    , detail : String
    }


type alias Model =
    { topics : Dict String String
    , topicsToCover : Set String
    , currentTopic : Maybe String
    , topicGenerator : Generator (Maybe String)
    , history : List Navigation.Location
    }


type Route
    = TopicDetail String
    | Game
    | Card


type Msg
    = NextRound Keyboard.KeyCode
    | PickTopic
    | ShowTopic (Maybe String)
    | UrlChange Navigation.Location
    | Reset
