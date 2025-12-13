{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE Unsafe      #-}

module Types.VerificationToken where

import Data.Aeson
import Data.Data
import Data.UUID.Types
import GHC.Generics
import Servant.API

-- don't use this - todo
newtype VerificationToken = VerificationToken {
    getVerificationToken :: UUID
} deriving stock (Generic, Data)
    -- do we need to redact ToHttpApiData?
    deriving (Eq, Ord, Read, FromJSON, FromHttpApiData, ToHttpApiData) via UUID

instance Show VerificationToken where
    show _ = "[redacted]"

instance ToJSON VerificationToken where
    toJSON _ = String "[redacted]"
