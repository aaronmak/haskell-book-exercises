main :: IO ()

newtype Word' =
  Word' String
  deriving (Eq, Show)

countNothing :: Eq a => [Maybe a] -> Integer
countNothing [] = 0
countNothing (x:xs)
  | x == Nothing = 1 + countNothing xs
  | otherwise = countNothing xs

countJust :: Eq a => [Maybe a] -> Integer
countJust [] = 0
countJust (x:xs)
  | x /= Nothing = 1 + countJust xs
  | otherwise = countJust xs

notVowel :: Char -> Maybe Char
notVowel 'a' = Nothing
notVowel 'e' = Nothing
notVowel 'i' = Nothing
notVowel 'o' = Nothing
notVowel 'u' = Nothing
notVowel x = Just x

countVowels :: String -> Integer
countVowels xs = countNothing $ fmap notVowel xs

countConsonants :: String -> Integer
countConsonants xs = countJust $ fmap notVowel xs

mkWord :: String -> Maybe Word'
mkWord xs
  | countVowels xs > countConsonants xs = Nothing
  | otherwise = Just (Word' xs)

main = do
  print $ mkWord "foo"
  print $ mkWord "hello"
