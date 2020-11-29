module VariationsOnEither where

data Validation e a =
    Failure e
  | Success a
  deriving (Eq, Show)


instance Functor (Validation e) where
  fmap f (Success a) = Success (f a)
  fmap f (Failure e) = Failure e

instance Monoid e =>
         Applicative (Validation e) where
  pure f = Success f
  Failure e <*> Success f = Failure e
  Success f <*> Failure e = Failure e
  Success f <*> Success x = Success (f x)
  Failure e <*> Failure ee = Failure (e <> ee)
