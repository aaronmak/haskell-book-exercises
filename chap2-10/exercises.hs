main :: IO ()

-- 1
-- let x = 3; y = 1000 in x * 3 + y

q1    = x * 3 + y
  where
    x = 3
    y = 1000

-- 2
-- let y = 10; x = 10 * 5 + y in x * 5

q2    = x * 5
  where
    y = 10
    x = 10 * 5 + y

-- 3
-- let x = 7; y = negate x; z = y * 10 in z / x + y

q3    = z / x + y
  where
    x = 7
    y = negate x
    z = y * 10


main = putStrLn ("q1: " ++ x ++ " | q2: " ++ y ++ " | q3: " ++ z)
  where
    x = show q1
    y = show q2
    z = show q3
