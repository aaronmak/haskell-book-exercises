main :: IO ()

data DividedResult =
    Result Integer
  | DividedByZero

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < 0 && d > 0 = numNegative n d count
         | n < 0 && d < 0 = bothNegative n d count
         | n > 0 && d < 0 = denomNegative n d count
         | n > 0 && d > 0 = bothPositive n d count

bothNegative n d count
           | n > d = (count, n)
           | otherwise =
              bothNegative (n - d) d (count + 1)

numNegative n d count
          | n > (-d) = (-count, n)
          | otherwise =
              numNegative (n + d) d (count + 1)

denomNegative n d count
          | n < abs d = (-count, n)
          | otherwise =
              denomNegative(n + d) d (count + 1)

bothPositive n d count
           | n < d = (count, n)
           | otherwise =
              bothPositive (n - d) d (count + 1)

main = do
  print (dividedBy 10 2 == (5, 0))
  print (dividedBy 10 (-2) == (-5, 0))
  print (dividedBy (-10) (-2) == (5, 0))
  print (dividedBy (-10) 2 == (-5, 0))
  print (dividedBy (-7) 2 == (-3, -1))

-- FIXME: Not sure how to do part b and handle DividedByZero
