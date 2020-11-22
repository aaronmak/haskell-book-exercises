module ListApplicativeExercise where

import Test.QuickCheck

data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)


instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure f = Cons f Nil
  Nil <*> _ = Nil
  _ <*> Nil = Nil
  Cons f xs <*> Cons g ys = Cons (f g) (xs <*> ys)
