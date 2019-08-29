main :: IO ()

fibs = 1 : scanl (+) 1 fibs

fibs20 = take 20 fibs

-- fibsLT100 = 1 : xs
--   where xs
--          | tail xs > 100 = xs
--          | otherwise = scanl (+) 1 xs
fibsLT100 = filter (<100) $ take 20 fibs

factorial = scanl (*) 1 [2..]

main = do
  print fibs20
  print fibsLT100
  print $ take 10 factorial
