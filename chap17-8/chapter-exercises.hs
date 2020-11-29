import Control.Applicative (liftA3)
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

-- Q1
-- []

-- pure :: a -> [a]
-- (<*>) :: [(a -> b)] -> [a] -> [b]

-- Q2
-- IO

-- pure :: a -> IO a
-- (<*>) :: IO (a -> b) -> IO a -> IO b

-- Q3
-- (,) a

-- pure :: Monoid a => b -> (a, b)
-- (<*>) :: Monoid c => (c, (a -> b)) -> (c, a) -> (c ,b)

-- Q4
-- (->) e

-- pure :: a -> (e -> a)
-- (<*>) :: e -> (a -> b) -> (e -> a) -> (e -> b)


-- Q1

data Pair a = Pair a a
  deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
  pure x = Pair x x
  Pair f f' <*> Pair x x' = Pair (f x) (f' x')

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = do
    x <- arbitrary
    return $ Pair x x

instance Eq a => EqProp (Pair a) where
  (=-=) = eq

pair = undefined :: Pair (String, String, Int)


-- Q2

data Two a b = Two a b
  deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two x y) = Two x (f y)

instance Monoid a => Applicative (Two a) where
  pure x = Two mempty x
  Two x f' <*> Two x' y = Two (x <> x') (f' y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Two x y

instance (Eq a, Eq b) => EqProp (Two a b) where
  (=-=) = eq

two = undefined :: Two String (String, String, Int)


-- Q3

data Three a b c = Three a b c
  deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three x y z) = Three x y (f z)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure x = Three mempty mempty x
  Three x y f <*> Three x' y' z' = Three (x <> x') (y <> y') (f z')

instance (Arbitrary a,
          Arbitrary b,
          Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Three x y z

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
  (=-=) = eq

three = undefined :: Three String [Int] (String, String, Int)


-- Q4

data Three' a b = Three' a b b
  deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' x y z) = Three' x (f y) (f z)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
  arbitrary = do
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return $ Three' x y z

instance Monoid a => Applicative (Three' a) where
  pure x = Three' mempty x x
  Three' x f f' <*> Three' x' y y' = Three' (x <> x') (f y) (f' y')

instance (Eq a, Eq b) => EqProp (Three' a b) where
  (=-=) = eq

three' = undefined :: Three' String (String, String, Int)


-- Q5

data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four w x y z) = Four w x y (f z)


instance (
    Arbitrary a,
    Arbitrary b,
    Arbitrary c,
    Arbitrary d)
    => Arbitrary (Four a b c d) where
  arbitrary = do
  v <- arbitrary
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return $ Four v x y z

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where
  (=-=) = eq

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
  pure x = Four mempty mempty mempty x
  Four w x y f <*> Four w' x' y' z' = Four (w <> w') (x <> x') (y <> y') (f z')

four = undefined :: Four String [Int] String (String, String, Int)


-- Q6

data Four' a b = Four' a a a b
  deriving (Eq, Show)

instance Functor (Four' a) where
  fmap f (Four' w x y z) = Four' w x y (f z)

instance Monoid a => Applicative (Four' a) where
  pure x = Four' mempty mempty mempty x
  Four' w x y f <*> Four' w' x' y' z' =
    Four' (w <> w') (x <> x') (y <> y') (f z')

instance (
    Arbitrary a,
    Arbitrary b)
    => Arbitrary (Four' a b) where
  arbitrary = do
  x <- arbitrary
  y <- arbitrary
  return $ Four' x x x y

instance (Eq a, Eq b) => EqProp (Four' a b) where
  (=-=) = eq

four' = undefined :: Four' String (String, String, Int)

-- Combinations

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)

main :: IO ()
main = do
  print "Tests running..."
  quickBatch $ functor pair
  quickBatch $ applicative pair
  quickBatch $ functor two
  quickBatch $ applicative two
  quickBatch $ functor three
  quickBatch $ applicative three
  quickBatch $ functor three'
  quickBatch $ applicative three'
  quickBatch $ functor four
  quickBatch $ applicative four
  quickBatch $ functor four'
  quickBatch $ applicative four'
  print $ combos stops vowels "abcde"
