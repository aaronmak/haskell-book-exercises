import Test.QuickCheck (Arbitrary, CoArbitrary, arbitrary, quickCheck, frequency)

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidRightIdentity a = (a <> mempty) == a

-- Q1
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  Trivial <> Trivial = Trivial

instance Monoid Trivial where
  mempty = Trivial
  mappend = (<>)

instance Arbitrary Trivial where
  arbitrary = return Trivial

type TrivAssoc =
  Trivial -> Trivial -> Trivial -> Bool

-- Q2
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  Identity a <> Identity b = Identity (a <> b)

instance Monoid a => Monoid (Identity a) where
  mempty = Identity mempty
  mappend (Identity a) (Identity b) = Identity (a `mappend` b)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return $ Identity a

type IdAssoc =
  Identity String -> Identity String -> Identity String -> Bool

-- Q3
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two a b <> Two a' b' = Two (a <> a') (b <> b')

instance (Monoid a, Monoid b) => Monoid (Two a b) where
  mempty = Two mempty mempty
  mappend (Two a b) (Two a' b') = Two (a `mappend` a') (b `mappend` b')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return $ Two a b

type TwoAssoc =
  Two String String -> Two String String -> Two String String -> Bool

type TwoIdentity = Two String String -> Bool


-- Q4
data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
  => Semigroup (Three a b c) where
  Three a b c <> Three a' b' c' = Three (a <> a') (b <> b') (c <> c')

instance (Arbitrary a, Arbitrary b, Arbitrary c)
  => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return $ Three a b c

type ThreeAssoc =
     Three [Int] [Int] [Int]
  -> Three [Int] [Int] [Int]
  -> Three [Int] [Int] [Int]
  -> Bool


-- Q5
data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d)
  => Semigroup (Four a b c d) where
  Four a b c d <> Four a' b' c' d' =
    Four (a <> a') (b <> b') (c <> c') (d <> d')

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
  => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return $ Four a b c d

type FourAssoc =
     Four [Int] [Int] [Int] [Int]
  -> Four [Int] [Int] [Int] [Int]
  -> Four [Int] [Int] [Int] [Int]
  -> Bool

-- Q6
newtype BoolConj =
  BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  BoolConj True <> BoolConj True = BoolConj True
  BoolConj _ <> BoolConj _ = BoolConj False

instance Monoid BoolConj where
  mempty = BoolConj True
  mappend = (<>)

instance Arbitrary BoolConj where
  arbitrary =  do
    a <- arbitrary
    return $ BoolConj a

type BoolConjAssoc =
  BoolConj -> BoolConj -> BoolConj -> Bool

-- Q7
newtype BoolDisj =
  BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  BoolDisj False <> BoolDisj False = BoolDisj False
  BoolDisj _ <> BoolDisj _ = BoolDisj True

instance Monoid BoolDisj where
  mempty = BoolDisj False
  mappend = (<>)

instance Arbitrary BoolDisj where
  arbitrary =  do
    a <- arbitrary
    return $ BoolDisj a

type BoolDisjAssoc =
  BoolDisj -> BoolDisj -> BoolDisj -> Bool


-- Q8
data Or a b =
    Fst a
  | Snd b
  deriving (Eq, Show)

instance Semigroup (Or a b) where
  Fst a <> Snd b = Snd b
  Fst a <> Fst b = Fst b
  Snd a <> Fst b = Snd a
  Snd a <> Snd b = Snd a

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [
        (1, return $ Fst a),
        (1, return $ Snd b)
      ]

type OrAssoc =
  Or [Int] String -> Or [Int] String  -> Or [Int] String -> Bool


-- Q9
newtype Combine a b =
  Combine { unCombine :: (a -> b) }

instance Show (Combine a b) where
  show _ = "Combine"

instance (Semigroup b) => Semigroup (Combine a b) where
  Combine f <> Combine f' = Combine (\x -> (f x) <> (f' x))

instance Monoid b => Monoid (Combine a b) where
  mempty = Combine (\_ -> mempty)
  mappend (Combine f) (Combine f') = Combine (\x -> (f x) `mappend` (f' x))


instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
  arbitrary = do
    f <- arbitrary
    return $ Combine f


type CombineAssoc =
     String
  -> Combine String [Int]
  -> Combine String [Int]
  -> Combine String [Int]
  -> Bool

combineAssoc :: CombineAssoc
combineAssoc s a b c =
  unCombine (a <> (b <> c)) s == unCombine ((a <> b) <> c) s

combineLeftId :: String -> Combine String [Int] -> Bool
combineLeftId s a =
  unCombine (mempty `mappend` a) s == (unCombine a) s

combineRightId :: String -> Combine String [Int] -> Bool
combineRightId s a =
  unCombine (a `mappend` mempty) s == (unCombine a) s

-- Q10
newtype Comp a =
  Comp { unComp :: (a -> a) }

instance Show (Comp a) where
  show _ = "Comp"

instance (Semigroup a) => Semigroup (Comp a) where
  Comp a <> Comp a' = Comp (a . a')

instance Monoid a => Monoid (Comp a) where
  mempty = Comp id
  mappend (Comp f) (Comp f') = Comp (f . f')

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
  arbitrary = do
    f <- arbitrary
    return $ Comp f

type CompAssoc =
     [Int]
  -> Comp [Int]
  -> Comp [Int]
  -> Comp [Int]
  -> Bool

compAssoc :: CompAssoc
compAssoc s a b c =
  unComp (a <> (b <> c)) s == unComp ((a <> b) <> c) s

compLeftId :: [Int] -> Comp [Int] -> Bool
compLeftId s a = unComp (mempty `mappend` a) s == (unComp a) s

compRightId :: [Int] -> Comp [Int] -> Bool
compRightId s a = unComp (a `mappend` mempty) s == (unComp a) s

-- Q11
data Validation a b =
  Failure a | Success b
  deriving (Eq, Show)

instance Semigroup a =>
  Semigroup (Validation a b) where
    Failure a <> Failure b = Failure (a <> b)
    Success a <> _ = Success a
    _ <> Success b = Success b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [
        (1, return $ Failure a),
        (1, return $ Success b)
      ]

type ValidationAssoc =
     Validation String Int
  -> Validation String Int
  -> Validation String Int
  -> Bool

-- Q8 from Monoid Exercises

newtype Mem s a =
  Mem {
    runMem :: s -> (a, s)
  }

instance Semigroup a => Semigroup (Mem s a) where
  (Mem f) <> (Mem f') = Mem $ \s ->
    let (a', s') = f s
        (a'', s'') = f' s'
    in (a' <> a'', s'')

instance Monoid a => Monoid (Mem s a) where
  mempty = Mem $ \s -> (mempty, s)

f' = Mem $ \s -> ("hi", s + 1)

main :: IO ()
main = do
  quickCheck (semigroupAssoc :: TrivAssoc)
  quickCheck (semigroupAssoc :: IdAssoc)
  quickCheck (semigroupAssoc :: TwoAssoc)
  quickCheck (semigroupAssoc :: ThreeAssoc)
  quickCheck (semigroupAssoc :: FourAssoc)
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
  quickCheck (semigroupAssoc :: OrAssoc)
  quickCheck (combineAssoc :: CombineAssoc)
  quickCheck (compAssoc :: CompAssoc)
  quickCheck (semigroupAssoc :: ValidationAssoc)
  quickCheck (monoidLeftIdentity :: Trivial -> Bool)
  quickCheck (monoidRightIdentity :: Trivial -> Bool)
  quickCheck (monoidLeftIdentity :: Identity String -> Bool)
  quickCheck (monoidRightIdentity :: Identity String -> Bool)
  quickCheck (monoidLeftIdentity :: TwoIdentity)
  quickCheck (monoidRightIdentity :: TwoIdentity)
  quickCheck (monoidLeftIdentity :: BoolConj -> Bool)
  quickCheck (monoidRightIdentity :: BoolConj -> Bool)
  quickCheck (monoidLeftIdentity :: BoolDisj -> Bool)
  quickCheck (monoidRightIdentity :: BoolDisj -> Bool)
  quickCheck (combineLeftId)
  quickCheck (combineRightId)
  quickCheck (compLeftId)
  quickCheck (compRightId)
  let rmzero = runMem mempty 0
      rmleft = runMem (f' <> mempty) 0
      rmright = runMem (mempty <> f') 0
  print $ rmleft
  print $ rmright
  print $ (rmzero :: (String, Int))
  print $ rmleft == runMem f' 0
  print $ rmright == runMem f' 0
  print "---"
