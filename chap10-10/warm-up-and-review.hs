main :: IO ()

stops  = "pbtdkg"
vowels = "aeiou"

appendCharToChars :: Char -> [Char] -> [[Char]]
appendCharToChars c xs =
  map (([c] ++) . (: [])) xs

combinationChars :: [Char] -> [Char] -> [[Char]]
combinationChars [] ys = []
combinationChars (x:xs) ys =
  appendCharToChars x ys ++ combinationChars xs ys

combinations :: [Char] -> [[Char]] -> [[Char]]
combinations [] yss = []
combinations (x:xs) yss =
  map ([x] ++) yss ++ combinations xs yss

sentenceToTuple :: [Char] -> (Char, Char, Char)
sentenceToTuple xs = (xs !! 0, xs !! 1, xs !! 2)

stopVowelStops :: [Char] -> [Char] ->
                  [(Char, Char, Char)]
stopVowelStops vs ss =
  map sentenceToTuple $ combinations ss $ combinationChars vs ss


main = do
  print "------"
  print $ appendCharToChars 'c' "foo"
  print $ combinations stops $ combinationChars vowels stops
  print $ combinations "fo" ["foo", "abc"]
  print $ stopVowelStops vowels stops
  print "------"
