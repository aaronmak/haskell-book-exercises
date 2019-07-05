main :: IO ()

-- 1

-- avgGrade x
--   | otherwise = 'F'
--   where y = x / 100

-- avgGrade will always return 'F'

-- 2

avgGrade x
  | y >= 0.7 = 'C'
  | y >= 0.9 = 'A'
  | y >= 0.8 = 'B'
  | y >= 0.59 = 'D'
  | y < 0.59 = 'F'
  where y = x / 100

checkAvgGrade = avgGrade 90 == 'C'

-- does not return A but will return C

-- 3

pal xs
  | xs == reverse xs = True
  | otherwise        = False

-- b) True when xs is a palindrome

-- 4

-- Eq a => [a]

-- 5

-- Eq a => [a] -> Bool

-- 6

numbers x
  | x < 0  = -1
  | x == 0 = 0
  | x > 0  = 1

-- c) an indication of whether its argument is a positive
--    or negative number or zero

-- 7

-- (Ord a, Num a)

-- 8

-- (Ord a, Num a, Num p) => a -> p

main = print checkAvgGrade
