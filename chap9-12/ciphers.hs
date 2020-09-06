module Cipher where

import Data.Char
import Test.Hspec
import Test.QuickCheck

caesar :: Char -> Int -> Char
caesar char n
  | ord char < 65 = char
  | n < 0 = char
caesar char n = chr $ ord char + n

unCaesar :: Char -> Int -> Char
unCaesar char n
  | ord char < 65 = char
  | n < 0 = char
unCaesar char n = chr $ ord char - n

caesarMap :: [Char] -> Int -> [Char]
caesarMap [] n = []
caesarMap (x:xy) n = [caesar x n] ++ caesarMap xy n


main :: IO ()
main = hspec $ do
  describe "Encode and decoding any character" $ do
    it "should give the same result" $ do
      property $ \x y -> unCaesar (caesar x y) y == x

-- Chap 13-14 Modifying code Q1
  -- putStrLn "What would you like to encode?"
  -- toEncode <- getLine
  -- putStrLn "By how many steps?"
  -- encryptSteps <- getLine
  -- let n = (read encryptSteps :: Int)
  -- putStrLn $ caesarMap toEncode n
