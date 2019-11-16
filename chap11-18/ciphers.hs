module Cipher where
import Data.Char

main :: IO ()

original = "MEET AT DAWN"
code = "ALLY"
expected = "MPPR AE OYWY"

encode :: [Char] -> [Char] -> [Char]
encode xs code =
  intToStr $
  addLists (strToInt xs) (incrementShift $ replaceStr xs code)


replaceStr :: [Char] -> [Char] -> [Char]
replaceStr xs [] = []
replaceStr [] ys = []
replaceStr (' ':xs) (y:ys) = ' ' : replaceStr xs (y:ys)
replaceStr (x:xs) (y:ys) = y : replaceStr xs (ys ++ [y])

incrementShift :: [Char] -> [Int]
incrementShift xs =
  makeNegativesZero $
  map (* (-1)) $
  map (65 -) $
  strToInt xs

makeNegativesZero :: [Int] -> [Int]
makeNegativesZero xs = map minZero xs

minZero :: Int -> Int
minZero x
  | x < 0 = 0
  | otherwise = x

addLists :: [Int] -> [Int] -> [Int]
addLists xs [] = []
addLists [] ys = []
addLists (x:xs) (y:ys) = (x + y) : addLists xs ys

limitToUpperCase :: Int -> Int
limitToUpperCase x
  | x > 91 = mod x 91 + 65
  | otherwise = x

intToStr :: [Int] -> [Char]
intToStr xs = map (chr . limitToUpperCase) xs

strToInt :: [Char] -> [Int]
strToInt xs = map ord xs

main = print $ encode original code == expected
