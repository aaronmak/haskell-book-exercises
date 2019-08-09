main :: IO ()

q1 = filter (\x -> (rem x 3) == 0)
q2 = length . q1

myFilter x =
  filter (/= "a") $
  filter (/= "the") $
  filter (/= "an") $
  words x

main = do
  print "foo"
  print $ q1 [1..30]
  print $ q2 [1..30]
  print $ myFilter "the brown dog was a goof"
