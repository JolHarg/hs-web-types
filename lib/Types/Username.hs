{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE Unsafe      #-}

module Types.Username (Username(Username), mkUsername, getUsername) where

import Data.Aeson
import Data.Data
import Data.Text
import GHC.Generics
import Servant.API
import Types.ErrorMessage

newtype Username = Username {
    getUsername :: Text
} deriving stock (Generic, Data)
    deriving (Eq, Show, Read, FromJSON, ToJSON, FromHttpApiData, ToHttpApiData) via Text

mkUsername ∷ Text → Either ErrorMessage Username
mkUsername = pure . Username -- @TODO
