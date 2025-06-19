{-# LANGUAGE Safe             #-}

module Types.ErrorMessage (ErrorMessage(getErrorMessage), errMsg) where

import Control.Monad.Except
import Data.Text

{-
data ErrorMessage = ErrorMessage {
    message :: Text,
    code :: Int
}
-}

newtype ErrorMessage = ErrorMessage {
    getErrorMessage :: Text
}

errMsg ∷ (MonadError ErrorMessage m) ⇒ Text → m a
errMsg = throwError . ErrorMessage
