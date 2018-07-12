-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Watchword.Object.User exposing (..)

import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Watchword.Enum.UserRole
import Watchword.InputObject
import Watchword.Interface
import Watchword.Object
import Watchword.Scalar
import Watchword.Union


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Watchword.Object.User
selection constructor =
    Object.selection constructor


{-| -}
id : Field Watchword.Scalar.Id Watchword.Object.User
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map Watchword.Scalar.Id)


{-| -}
createdAt : Field Watchword.Scalar.DateTime Watchword.Object.User
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map Watchword.Scalar.DateTime)


{-| -}
updatedAt : Field Watchword.Scalar.DateTime Watchword.Object.User
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map Watchword.Scalar.DateTime)


{-| -}
name : Field String Watchword.Object.User
name =
    Object.fieldDecoder "name" [] Decode.string


{-| -}
email : Field String Watchword.Object.User
email =
    Object.fieldDecoder "email" [] Decode.string


{-| -}
games : SelectionSet decodesTo Watchword.Object.Game -> Field (List decodesTo) Watchword.Object.User
games object =
    Object.selectionField "games" [] object (identity >> Decode.list)


{-| -}
role : Field Watchword.Enum.UserRole.UserRole Watchword.Object.User
role =
    Object.fieldDecoder "role" [] Watchword.Enum.UserRole.decoder