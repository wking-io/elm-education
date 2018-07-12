module Request exposing (make)

import Graphqelm.Http
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet)
import Task exposing (Task)
import Data.AuthToken exposing (AuthToken, withAuthorization)


make : Maybe AuthToken -> SelectionSet decodesTo RootQuery -> Task (Graphqelm.Http.Error decodesTo) decodesTo
make token query =
    query
        |> Graphqelm.Http.queryRequest "http://localhost:8000/graphql"
        |> withAuthorization token
        |> Graphqelm.Http.toTask