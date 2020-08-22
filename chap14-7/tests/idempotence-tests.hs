import Test.Hspec
import Test.QuickCheck
import Data.Char
import Data.List (sort)

main :: IO ()

twice f = f . f
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord w@(x:xs)
  | x == ' ' = x : capitalizeWord xs
  | x == toUpper x = w
  | otherwise = toUpper x : xs

f x =
  (capitalizeWord x
  == twice capitalizeWord x)
  &&
  (capitalizeWord x
  == fourTimes capitalizeWord x)

f' :: String -> Bool
f' x =
  (sort x
  == twice sort x)
  &&
  (sort x
  == fourTimes sort x)


main = hspec $ do
  describe "Question 1" $ do
    it "capitalizeWord is idempotent" $ do
      property $ \x -> f x
    it "sort is idempotent" $ do
      property $ \x -> f' x
