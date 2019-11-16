import Data.Char
import Data.List

main :: IO ()


isSubseqOf :: (Eq a)
           => [a]
           -> [a]
           -> Bool
isSubseqOf [] ys = True
isSubseqOf xs [] = False
isSubseqOf t@(x:xs) (y:ys)
  | x == y = True && isSubseqOf xs ys
  | otherwise = isSubseqOf t ys

main = do
  print $ isSubseqOf "blah" "wblaah" == True
  print $ isSubseqOf "blah" "wootbla" == False
  print $ isSubseqOf "blah" "halb" == False
