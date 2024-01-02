{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE DerivingVia        #-}
{-# LANGUAGE Unsafe #-}

module Types.Password (Password(Password), mkPassword, getPassword) where

import Control.Monad      (when)
import Data.Aeson
import Data.Data
import Data.Text          as T
import GHC.Generics
import Servant.API
import Types.ErrorMessage

-- don't use this - todo
newtype Password = Password {
    getPassword :: Text
} deriving stock (Generic, Data)
    -- do we need to redact ToHttpApiData?
    deriving (Eq, Read, Show, FromJSON, ToJSON, FromHttpApiData, ToHttpApiData) via Text

-- TODO redaction

mkPassword ∷ Text → Either ErrorMessage Password
mkPassword text = do
    when ((< 8) . T.length $ text) . errMsg $ "Password is not long enough."
    pure $ Password text
