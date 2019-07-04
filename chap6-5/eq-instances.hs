main :: IO ()

-- 1

data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  TisAn integer == TisAn integer' =
    integer == integer'

-- 2

data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where
  Two firstInteger secondInteger == Two firstInteger' secondInteger' =
    firstInteger == firstInteger' && secondInteger == secondInteger'

-- 3

data StringOrInt =
    TisAnInt   Int
  | TisAString String

instance Eq StringOrInt where
  TisAnInt int == TisAnInt int' = int == int'
  TisAString string == TisAString string' = string == string'
  TisAString string == TisAnInt int = False

-- 4

data Pair a =
  Pair a a

instance Eq a => Eq (Pair a) where
  Pair a1 a2 == Pair a1' a2' =
    a1 == a1' && a2 == a2'

-- 5

data Tuple a b =
  Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  Tuple a b == Tuple a' b' =
    a == a' && b == b'

-- 6

data Which a =
    ThisOne a
  | ThatOne a

instance Eq a => Eq (Which a) where
  ThisOne a == ThisOne a' = a == a'
  ThatOne a == ThatOne a' = a == a'
  ThisOne a == ThatOne a' = False

-- 7

data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  Hello a == Hello a' = a == a'
  Goodbye b == Goodbye b' = b == b'
  Hello a == Goodbye b = False

main = print "foo"
