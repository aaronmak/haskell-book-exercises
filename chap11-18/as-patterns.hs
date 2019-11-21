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


capitalizeWord :: String
               -> (String, String)
capitalizeWord w@(x:xs) = (w, toUpper x:xs)

capitalizeWords :: String
                -> [(String, String)]
capitalizeWords xs = map capitalizeWord $ words xs

main = do
  print $ isSubseqOf "blah" "wblaah" == True
  print $ isSubseqOf "blah" "wootbla" == False
  print $ isSubseqOf "blah" "halb" == False
  print $ capitalizeWords "hello world"
