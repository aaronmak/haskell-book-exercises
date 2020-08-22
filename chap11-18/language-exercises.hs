import Data.Char
import Data.List

main :: IO ()

capitalizeWord :: String -> String

capitalizeWord "" = ""
capitalizeWord w@(x:xs)
  | x == ' ' = x : capitalizeWord xs
  | x == toUpper x = w
  | otherwise = toUpper x : xs

capitalizeParagraph :: String -> String
capitalizeParagraph xs =
  foldl (++) []
  $ map capitalizeWord
  $ splitByPeriod xs

isSentenceBreak :: Char -> Char -> Bool
isSentenceBreak x y = (x /= '.' && y /= '.')

splitByPeriod :: String -> [String]
splitByPeriod xs = groupBy isSentenceBreak xs

main = do
  print $ capitalizeWord "" == ""
  print $ capitalizeWord "foo" == "Foo"
  print $ capitalizeWord "Foo" == "Foo"
  print $ splitByPeriod "blah. woot ha."
  print $ capitalizeParagraph "blah. woot ha."
