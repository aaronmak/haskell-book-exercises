main :: IO ()

stops  = "pbtdkg"
vowels = "aeiou"

nouns = ["boy", "fox"]
verbs = ["run", "walk"]

mapElement :: a -> [a] -> [[a]]
mapElement c xs =
  map (([c] ++) . (: [])) xs

combine :: [a] -> [a] -> [[a]]
combine [] ys = []
combine (x:xs) ys =
  mapElement x ys ++ combine xs ys

combinations :: [a] -> [[a]] -> [[a]]
combinations [] yss = []
combinations (x:xs) yss =
  map ([x] ++) yss ++ combinations xs yss

firstThree :: [a] -> (a, a, a)
firstThree (x:y:z:xs) = (x, y, z)

stopVowelStops :: [Char]
               -> [Char]
               -> [(Char, Char, Char)]
stopVowelStops vs ss =
  map firstThree $ combinations ss $ combine vs ss

firstOfThree :: (a, b, c) -> a
firstOfThree (x, _, _) = x

filterP :: [(Char, Char, Char)] -> [(Char, Char, Char)]
filterP xs = filter (\x -> (firstOfThree x) /= 'p') xs

stopVowelStopsStartP vs ss =
  filterP $ stopVowelStops vs ss

nounVerbNouns :: [[Char]]
              -> [[Char]]
              -> [([Char], [Char], [Char])]
nounVerbNouns nn vs =
  map firstThree $ combinations nn $ combine vs nn


seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))

seekritFuncPrecise x = chars / wordCount
  where
    wordList = words x
    chars = realToFrac (sum (map length wordList))
    wordCount = realToFrac (length wordList)

main = do
  print "------"
  print "---q1---"
  print $ mapElement 'c' "foo"
  print $ combine "fo" "ae"
  print $ combinations "fo" ["foo", "abc"]
  print $ stopVowelStops vowels stops -- (1a)
  print $ stopVowelStopsStartP vowels stops -- (1b)
  print $ nounVerbNouns nouns verbs -- (1c)
  print "---q2---"
  print $ seekritFunc "hello world"
  print $ seekritFuncPrecise "hello wo" -- (2)
  print "------"
