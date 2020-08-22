import Test.Hspec
import Test.QuickCheck
import Text.Show.Functions
import Data.List (sort)

main :: IO ()

half x = x / 2
halfIdentity = (*2) . half

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
    where go _ status@(_, False) = status
          go y (Nothing, t) = (Just y, t)
          go y (Just x, t) = (Just y, x >= y)


plusAssociative ::  Int -> Int -> Int -> Bool
plusAssociative x y z =
  x + (y + z) == (x + y) + z

plusCommutative :: Int -> Int -> Bool
plusCommutative x y =
  x + y == y + x

multiplyAssociative :: Int -> Int -> Int -> Bool
multiplyAssociative x y z =
  x * (y * z) == (x * y) * z

multiplyCommutative :: Int -> Int -> Bool
multiplyCommutative x y =
  x * y == y * x


quotToRem :: Int -> Int -> Bool
quotToRem _ 0 = True
quotToRem x y =
  (quot x y * y) + (rem x y) == x

divToMod :: Int -> Int -> Bool
divToMod _ 0 = True
divToMod x y =
  (div x y) * y + (mod x y) == x


powerAssociative :: Int -> Int -> Int -> Bool
powerAssociative x y z =
  x ^ (y ^ z) == (x ^ y) ^ z

powerCommutative :: Int -> Int -> Bool
powerCommutative x y =
  x ^ y == y ^ x


reverseTwice :: [Char] -> Bool
reverseTwice x =
  (reverse . reverse) x == id x


propDollar :: (Char -> Int) -> (Int -> Char) -> Int -> Bool
propDollar f g x =
  (f $ g x) == f (g x)


foldrProof :: [Char] -> [Char] -> Bool
foldrProof xs ys = (foldr (:) xs) ys == (++) xs ys

concatProof :: [[Char]] -> Bool
concatProof xs =
  foldr (++) [] xs == concat xs

checkLength :: Int -> [Char] -> Bool
checkLength n xs =
  length (take n xs) == n

testShow :: Int -> Bool
testShow x = (read (show x)) == x


data Trivial =
  Trivial
  deriving (Eq, Show)
trivialGen :: Gen Trivial
trivialGen =
  return Trivial


main = hspec $ do
  describe "Question 1" $ do
    it "double of the half of all values is equal to the original value" $ do
      property $ \x -> halfIdentity x == (x :: Float)
  describe "Question 2" $ do
    it "for any list you apply sort to, this property should hold" $ do
      property $ \x -> listOrdered (sort (x :: String) )
  describe "Question 3" $ do
    it "for any integer, addition is associative" $ do
      property $ \x y z -> plusAssociative x y z
    it "for any integer, addition is commutative" $ do
      property $ \x y -> plusCommutative x y
  describe "Question 4" $ do
    it "for any integer, multiplication is associative" $ do
      property $ \x y z -> multiplyAssociative x y z
    it "for any integer, multiplication is commutative" $ do
      property $ \x y -> multiplyCommutative x y
  describe "Question 5" $ do
    it "relationship between quot to rem is consistent" $ do
      property $ \x y -> quotToRem x y
    it "relationship between div to mod is consistent" $ do
      property $ \x y -> divToMod x y
  describe "Question 6" $ do  -- expect failure
    it "for any integer, ^ is associative" $ do
      property $ \x y z -> powerAssociative x y z
    it "for any integer, ^ is commutative" $ do
      property $ \x y -> powerCommutative x y
  describe "Question 7" $ do
    it "Reversing a list twice results in the original list" $ do
      property $ \xs -> reverseTwice xs
  describe "Question 8" $ do
    it "`$` holds for any function" $ do
      property $ \f g x -> propDollar f g x
  describe "Question 9" $ do  -- expect failure
    it "foldr (:) == (++)" $ do
      property $ \xs ys -> foldrProof xs ys
    it "foldr (++) [] == concat" $ do
      property $ \xs -> concatProof xs
  describe "Question 10" $ do  -- expect failure
    it "f n xs = length (take n xs) == n" $ do
      property $ \x xs -> checkLength x xs
  describe "Question 11" $ do
    it "read is the opposite of show" $ do
      property $ \x -> testShow x
