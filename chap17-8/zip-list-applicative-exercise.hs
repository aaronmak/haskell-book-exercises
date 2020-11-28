module ZipListApplicativeExerciese where

import Control.Applicative
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

newtype ZipList' a =
  ZipList' [a]
  deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
  xs =-= ys = xs' `eq` ys'
    where xs' = let (ZipList' l) = xs
                in take 3000 l
          ys' = let (ZipList' l) = ys
                in take 3000 l

instance Functor ZipList' where
  fmap f (ZipList' xs) =
    ZipList' $ fmap f xs

myZip :: [(a -> b)] -> [a] -> [b]
myZip _ [] = []
myZip [] _ = []
myZip (f:fs) (x:xs) = [f x] <> myZip fs xs

instance Applicative ZipList' where
  pure x = ZipList' (repeat x)
  ZipList' xs <*> ZipList' ys = ZipList' (myZip xs ys)

instance Arbitrary a => Arbitrary (ZipList' a) where
  arbitrary = ZipList' <$> arbitrary

type SSS = (String, String, String)
trigger :: [SSS]
trigger = undefined

main :: IO ()
main = do
  quickBatch $ applicative (ZipList' trigger)
