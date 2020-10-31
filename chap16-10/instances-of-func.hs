import Test.QuickCheck

main :: IO ()

newtype Identity a = Identity a deriving (Eq, Show)


functorIdentity :: (Functor f, Eq (f a)) =>
                       f a
                    -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Eq (f c), Functor f) =>
                       (a -> b)
                    -> (b -> c)
                    -> f a
                    -> Bool
functorCompose f g x =
  (fmap g (fmap f x)) == (fmap (g . f) x)


-- Q1

instance Functor (Identity) where
  fmap f (Identity a) = Identity (f a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
  x <- arbitrary
  return $ Identity x

testIdentityIdentity :: [Identity Int] -> Bool
testIdentityIdentity x = functorIdentity x

identityCompose = functorCompose (++ "a") (++ "b")
testIdentityCompose x = identityCompose(x :: Identity String)

-- Q2

data Pair a = Pair a a deriving (Eq, Show)

instance Functor (Pair) where
  fmap f (Pair a b) = Pair (f a) (f b)

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = do
  x <- arbitrary
  return $ Pair x x

testPairIdentity :: [Pair Int] -> Bool
testPairIdentity x = functorIdentity x

pairCompose = functorCompose (+1) (*2)
testPairCompose x = pairCompose(x :: Pair Int)

-- Q3

data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
  x <- arbitrary
  y <- arbitrary
  return $ Two x y

testTwoIdentity :: [Two Int String] -> Bool
testTwoIdentity x = functorIdentity x

twoCompose = functorCompose (++ "b") (++ "c")
testTwoCompose x = twoCompose(x :: Two Int String)

-- Q4

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return $ Three x y z

testThreeIdentity :: [Three Int String Char] -> Bool
testThreeIdentity x = functorIdentity x

threeCompose = functorCompose (+1) (*10)
testThreeCompose x = threeCompose(x :: Three Char String Int)

-- Q5

data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' a b c) = Three' a (f b) (f c)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
  arbitrary = do
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return $ Three' x y z

testThree'Identity :: [Three' String Int] -> Bool
testThree'Identity x = functorIdentity x

three'Compose = functorCompose (+2) (*2)
testThree'Compose x = three'Compose(x :: Three' String Int)

-- Q6

data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

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

testFourIdentity :: [Four Int Char String Char] -> Bool
testFourIdentity x = functorIdentity x

fourCompose = functorCompose (+1) (*10)
testFourCompose x = fourCompose(x :: Four String Char String Int)

-- Q7

data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
  fmap f (Four' a b c d) = Four' a b c (f d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
  arbitrary = do
  v <- arbitrary
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return $ Four' v x y z

testFour'Identity :: [Four' Int Char] -> Bool
testFour'Identity x = functorIdentity x

four'Compose = functorCompose (+1) (*10)
testFour'Compose x = four'Compose(x :: Four' Char Int)


-- Q8

data Trivial = Trivial deriving (Eq, Show)

-- instance Functor (Trivial) where
--   fmap f (Trivial) = Trivial

-- doesn't work because it expects kind '* -> *' but Trivial cannot do that


main = do
  print "--------------------"
  quickCheck testIdentityIdentity
  quickCheck testIdentityCompose
  quickCheck testPairIdentity
  quickCheck testIdentityCompose
  quickCheck testTwoIdentity
  quickCheck testTwoCompose
  quickCheck testThreeIdentity
  quickCheck testThreeCompose
  quickCheck testThree'Identity
  quickCheck testThree'Compose
  quickCheck testFourIdentity
  quickCheck testFourCompose
  quickCheck testFour'Identity
  quickCheck testFour'Compose
