main :: IO ()

notThe :: String -> Maybe String
notThe xs
  | xs == "the" = Nothing
  | otherwise = Just xs

replaceNothing :: String -> Maybe String -> Maybe String
replaceNothing x Nothing = Just x
replaceNothing _ (Just x) = Just x

getString :: Maybe String -> String
getString (Just x) = x
getString Nothing = ""

replaceThe :: String -> String
replaceThe xs =
  unwords $
  fmap (getString . (replaceNothing "a") . notThe) $
  words xs

isVowelInitialWord :: String -> Maybe String
isVowelInitialWord w@(x:_)
  | x == 'a' = Just w
  | x == 'e' = Just w
  | x == 'i' = Just w
  | x == 'o' = Just w
  | x == 'u' = Just w
  | otherwise = Nothing

notTheBeforeVowel :: String
                  -> String
                  -> Maybe String

notTheBeforeVowel "the" ('a':_) = Nothing
notTheBeforeVowel "the" ('e':_) = Nothing
notTheBeforeVowel "the" ('i':_) = Nothing
notTheBeforeVowel "the" ('o':_) = Nothing
notTheBeforeVowel "the" ('u':_) = Nothing
notTheBeforeVowel xs _ = Just xs

mapTwo :: (a -> a -> Maybe a)
       -> [a]
       -> [Maybe a]
mapTwo f (x:y:xs) = [f x y] ++ mapTwo f (y:xs)
mapTwo f (x:[]) = [Just x]

countNothing :: Eq a => [Maybe a] -> Integer
countNothing [] = 0
countNothing (x:xs)
  | x == Nothing = 1 + countNothing xs
  | otherwise = countNothing xs

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs =
  countNothing $
  mapTwo notTheBeforeVowel $
  words xs

notVowel :: Char -> Maybe Char
notVowel 'a' = Nothing
notVowel 'e' = Nothing
notVowel 'i' = Nothing
notVowel 'o' = Nothing
notVowel 'u' = Nothing
notVowel x = Just x

countVowels :: String -> Integer
countVowels xs = countNothing $ fmap notVowel xs

main = do
  print $ notThe "woot"
  print $ notThe "the"
  print $ replaceThe "the cow loves us"
  print $ countTheBeforeVowel "the cow"
  print $ countTheBeforeVowel "the evil cow"
  print $ countVowels "the cow"
  print $ countVowels "Mikolajczak"
