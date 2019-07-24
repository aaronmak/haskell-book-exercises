main :: IO ()

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < d = (count, n)
         | otherwise =
            go (n - d) d (count + 1)


q1 = dividedBy 15 2 == (7, 1)
-- go 15 2 0
-- go 13 2 1
-- go 11 2 2
-- go 9 2 3
-- go 7 2 4
-- go 5 2 5
-- go 3 2 6
-- go 1 2 7

sumUpTo :: (Eq a, Num a) => a -> a
sumUpTo 0 = 0
sumUpTo n = n + sumUpTo (n-1)

q2 = sumUpTo 5 == 15

multiply :: (Integral a) => a -> a -> a
multiply x 0 = 0
multiply x y = x + (multiply x (y - 1))

q3 = multiply 5 4 == 20

main = do
  print q2
  print q3

