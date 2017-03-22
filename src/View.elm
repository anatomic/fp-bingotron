module View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Markdown
import Dict
import Set


topicContent : Model -> Maybe String
topicContent model =
    case model.currentTopic of
        Nothing ->
            Nothing

        Just t ->
            Dict.get t model.topics


root : Model -> Html Msg
root model =
    div [ class "slide" ]
        [ case model.currentTopic of
            Nothing ->
                div [] []

            Just t ->
                ul [ class "topics-remaining" ]
                    (List.map
                        viewTopicTitle
                     <|
                        Set.toList model.topicsToCover
                    )
        , div
            [ class "slide-inner" ]
            [ slideContent model
            ]
        ]


slideContent : Model -> Html msg
slideContent model =
    case model.currentTopic of
        Nothing ->
            img [ src "/bingo.gif", class "bingo" ] []

        Just topic ->
            case topicContent model of
                Nothing ->
                    h1 [] [ text "@anatomic's Functional JS Bingotron" ]

                Just m ->
                    Markdown.toHtml [ class "content" ] m


viewTopicTitle : String -> Html msg
viewTopicTitle title =
    li [ class "topic-title" ] [ text title ]
