{-# LANGUAGE FlexibleInstances #-}
import GHC.Arr

-- Q1 - No

data Bool =
  False | True

-- Q2 - Yes

data BoolAndSomethingElse a =
  False' a | True' a

-- Q3 - Yes

data BoolAndMaybeSomethingElse a =
  Falsish | Truish a

-- Q4 - Yes?

newtype Mu f = InF { outF :: f (Mu f) }

-- Q5 - Yes

data D =
  D (Array Word Word) Int Int

------------

-- Q1

data Sum a b =
    First b
  | Second a

instance Functor (Sum e) where
  fmap f (First a) = First (f a)
  fmap f (Second b) = Second b

-- Q2

data Company a b c =
    DeepBlue a b
  | Something c

instance Functor (Company e e') where
  fmap f (Something b) = Something (f b)
  fmap _ (DeepBlue a c) = DeepBlue a c

-- Q3

data More a b =
    L b a b
  | R a b a

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'


------------

-- Q1

data Quant a b =
    Finance
  | Desk a
  | Bloor b

instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap _ (Desk a) = Desk a
  fmap f (Bloor b) = Bloor (f b)


-- Q2

data K a b =
  K a

instance Functor (K a) where
  fmap f (K a) = K a


-- Q3

newtype Flip f a b =
  Flip (f b a)
  deriving (Eq, Show)

instance Functor (Flip K a) where
  fmap f (Flip (K a)) = Flip (K (f a))

-- Q4

data EvilGoateeConst a b =
  GoatyConst b

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst (f b)

-- Q5

data LiftItOut f a =
  LiftItOut (f a)

instance Functor f
      => Functor (LiftItOut f) where
      fmap f (LiftItOut fa) = LiftItOut (fmap f fa)

-- Q6

data Parappa f g a =
  DaWrappa (f a) (g a)

instance (Functor f, Functor g)
      => Functor (Parappa f g) where
      fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)


-- Q7

data IgnoreOne f g a b =
  IgnoringSomething (f a) (g b)

instance (Functor f, Functor g)
      => Functor (IgnoreOne f g a) where
      fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

-- Q8

data Notorious g o a t =
  Notorious (g o) (g a) (g t)

instance Functor g
      => Functor (Notorious g o a) where
      fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)

 -- Q9

data List a =
    Nil
  | Cons a (List a)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons a ls) = Cons (f a) (fmap f ls)

-- Q10

data GoatLord a =
    NoGoat
  | OneGoat a
  | MoreGoats (GoatLord a)
              (GoatLord a)
              (GoatLord a)

instance Functor GoatLord where
  fmap _ NoGoat = NoGoat
  fmap f (OneGoat a) = OneGoat (f a)
  fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

-- Q11

data TalkToMe a =
    Halt
  | Print String a
  | Read (String -> a)

instance Functor TalkToMe where
  fmap _ Halt = Halt
  fmap f (Print x a) = Print x (f a)
  fmap f (Read g) = Read (f . g)

main :: IO ()
main = print "foo"
