module Cipher where

import Data.Char

caesar :: Char -> Int -> Char
caesar char n = chr $ mod (ord char + n - ord 'a') 26 + ord 'a'

unCaesar :: Char -> Int -> Char
unCaesar char n = chr $ mod (ord char - n - ord 'a') 26 + ord 'a'

caesarMap :: [Char] -> Int -> [Char]
caesarMap [] n = []
caesarMap (x:xy) n = [caesar x n] ++ caesarMap xy n


-- Chap 13-14 Modifying code Q1
main :: IO ()
main = do
  putStrLn "What would you like to encode?"
  toEncode <- getLine
  putStrLn "By how many steps?"
  encryptSteps <- getLine
  let n = (read encryptSteps :: Int)
  putStrLn $ caesarMap toEncode n
