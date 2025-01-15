module Effect.Shuffle where

import Prelude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Maybe (Maybe(..))
import Effect (Effect)

foreign import shuffle ∷ ∀ a. Array a → Effect (Array a)

foreign import pickOr ∷ ∀ a. a → Array a → Effect a

foreign import pickMaybeImpl ∷
  ∀ a. (∀ x. x → Maybe x) → (∀ x. Maybe x) → Array a → Effect (Maybe a)

foreign import pickNonEmpty ∷ ∀ a. NonEmptyArray a → Effect a

pick ∷ ∀ a. Monoid a ⇒ Array a → Effect a
pick = pickOr mempty

pickMaybe ∷ ∀ a. Array a → Effect (Maybe a)
pickMaybe = pickMaybeImpl Just Nothing
