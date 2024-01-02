{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE Unsafe #-}

module Types.UserType where

import Data.Aeson  as A
import Data.Data
import Servant.API
import Text.Read   as R

data UserType = Normal | Admin | Superuser
    deriving stock (Eq, Ord, Data)

instance Read UserType where
    readPrec = do
        s <- lexP
        case s of
            R.String "NORMAL"    -> pure Normal
            R.String "ADMIN"     -> pure Admin
            R.String "SUPERUSER" -> pure Superuser
            _                    -> pfail

instance Show UserType where
    show = \case
        Normal    -> "Regular User"
        Admin     -> "Administrator"
        Superuser -> "Superuser"

instance ToHttpApiData UserType where
    toUrlPiece = \case
        Normal    -> "NORMAL"
        Admin     -> "ADMIN"
        Superuser -> "SUPERUSER"

instance FromHttpApiData UserType where
    parseUrlPiece "NORMAL"    = Right Normal
    parseUrlPiece "ADMIN"     = Right Admin
    parseUrlPiece "SUPERUSER" = Right Superuser
    parseUrlPiece a           = Left $ "No URL parse for " <> a

instance FromJSON UserType where
    parseJSON (A.String a) = case a of
        "NORMAL"    -> pure Normal
        "ADMIN"     -> pure Admin
        "SUPERUSER" -> pure Superuser
        x           -> fail $ "No UserType JSON parse for " <> show x
    parseJSON a = fail $ "No UserType JSON parse for " <> show a

instance ToJSON UserType where
    toJSON Normal    = A.String "NORMAL"
    toJSON Admin     = A.String "ADMIN"
    toJSON Superuser = A.String "SUPERUSER"
