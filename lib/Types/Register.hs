{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE DerivingStrategies #-}

module Types.Register where

import           Data.Aeson
import           GHC.Generics
import           Types.Email
import           Types.Name
import           Types.Password
import           Types.Username

data Register = Register {
    username :: Username,
    email    :: Email,
    name     :: Name,
    password :: Password
} deriving stock (Eq, Show, Read, Generic)
    deriving anyclass (FromJSON, ToJSON)
