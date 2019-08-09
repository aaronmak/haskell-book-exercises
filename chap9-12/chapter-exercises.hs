import Data.Char

main :: IO ()

q2 = filter isUpper

q3 x = (toUpper (head x)) : [] ++ drop 1 x

q4 x = map toUpper x

q5 x = (toUpper . head) x

main = do
  print "---start---"
  print $ q2 "HbEfLrLxO"
  print $ q3 "julie"
  print $ q4 "woot"
  print $ q5 "Julie"

