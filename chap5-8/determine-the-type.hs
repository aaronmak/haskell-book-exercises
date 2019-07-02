module DetermineTheType where

example = 1

q1a = (* 9) 6
expected_q1a = 54 :: Integer
is_correct_q1a = q1a == expected_q1a

q1b = head [(0, "doge"), (1, "kitteh")]
expected_q1b = (0, "doge") :: (Int, [Char])
is_correct_q1b = q1b == expected_q1b

q1c = head [(0:: Integer, "doge"), (1, "kitteh")]
expected_q1c = (0, "doge") :: (Integer, [Char])
is_correct_q1c = q1c == expected_q1c

q1d = if False then True else False
expected_q1d = False :: Bool
is_correct_q1d = q1d == expected_q1d

q1e = length [1, 2, 3, 4, 5]
expected_q1e = 5 :: Int
is_correct_q1e = q1e == expected_q1e

q1f = (length [1, 2, 3, 4]) > (length "TACOCAT")
expected_q1f = False :: Bool
is_correct_q1f = q1f == expected_q1f

-- 2

-- x = 5
-- y = x + 5
-- w :: Integer
-- w = y * 10

-- 3

-- x = 5
-- y = x + 5
-- z y = y * 10
-- z :: Integer -> Integer

-- 4

-- x = 5
-- y = x + 5
-- f = 4 / y
-- f :: Double

-- 5

x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
f :: [Char]

-- Some answers are commented out to not
-- have compile errors due to using the same
-- variable
