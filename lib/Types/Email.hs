{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE Unsafe      #-}

module Types.Email (Email(Email), mkEmail, getEmail) where

import Data.Aeson
import Data.Data
import Data.Text
import GHC.Generics
import Servant.API
import Types.ErrorMessage

newtype Email = Email {
    getEmail :: Text
} deriving stock (Generic, Data)
    deriving (FromJSON, ToJSON, Show, Read, Eq, FromHttpApiData, ToHttpApiData) via Text

mkEmail ∷ Text → Either ErrorMessage Email
mkEmail = pure . Email -- @TODO
