{-# LANGUAGE DerivingVia        #-}
{-# LANGUAGE Unsafe             #-}

module Types.Login where

import Data.Aeson
import GHC.Generics
import Types.Password
import Types.Username

data Login = Login {
    username :: Username,
    password :: Password
} deriving stock (Eq, Show, Read, Generic)
    deriving (FromJSON, ToJSON) via Generically Login
