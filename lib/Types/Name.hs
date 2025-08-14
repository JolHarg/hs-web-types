{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE Unsafe      #-}

module Types.Name (Name(Name), mkName, getName) where

import Control.Monad      (when)
import Data.Aeson
import Data.Char
import Data.Data
import Data.Text          as T
import GHC.Generics
import Servant.API
import Types.ErrorMessage

newtype Name = Name {
    getName :: Text
} deriving stock (Generic, Data)
    deriving (Eq, Show, Read, FromJSON, ToJSON, FromHttpApiData, ToHttpApiData) via Text

mkName ∷ Text → Either ErrorMessage Name
mkName potentialName = do
    when (T.all isNumber potentialName) $ errMsg "Name can't be all numbers."
    when (T.all isLetter potentialName && T.length potentialName < 2) $
        errMsg "Name can't be one character."
    pure $ Name potentialName
