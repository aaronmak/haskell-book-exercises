import Data.Bool
main :: IO ()

q1 = take 1 $ map (+1) [undefined, 2, 3]
q2 = take 1 $ map (+1) [1, undefined, 3]
q3 = take 2 $ map (+1) [1, undefined, 3]

itIsMystery xs =
  map (\x -> elem x "aeiou") xs

q5a = map (^2) [1..10]
q5b = map minimum [[1..10], [10..20], [20..30]]
q5c = map sum [[1..5], [1..5], [1..5]]

q6 = map (\x -> bool x (-x) (x == 3)) [1..10]

main = do
  print "---start---"
  -- print q1
  print q2
  -- print q3
  print $ itIsMystery "foobar"
  print q5a
  print q5b
  print q5c
  print q6
  print "---end---"
