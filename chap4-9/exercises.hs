main :: IO ()

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 1
-- length :: [a] -> Int
-- One argument, List, evaluates to Int

-- 2

q2a = length [1, 2, 3, 4, 5] == 5
q2b = length [(1, 2), (2, 3), (3, 4)] == 3
q2c = length allAwesome == 2
q2d = length (concat allAwesome) == 5

-- 3

-- 6 / length [1, 2, 3] would not work
-- because it returns an Integer type
-- which is not Fractional

-- 4
q4 = 6 `div` (length [1, 2, 3])

-- 5

q5 = (2 + 3 == 5) == True

-- 6

x = 5
q6 = (x + 3 == 5) == False

-- 7

q7a = (length allAwesome == 2) == True

-- length [1. 'a', 3, 'b'] wouldn't work
-- because list has to have the same type

q7c = (length allAwesome + length awesome) == 5

q7d = ((8 == 8) && ('b' < 'a')) == False

-- (8 == 8) && 9 wouldn't work
-- because && requires arguments to be
-- of same type

-- 8

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = (reverse x == x)

-- 9

myAbs :: Integer -> Integer
myAbs x = do
  if x < 0
  then - x
  else x

-- 10

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))


main = do
  print q2a
  print q2b
  print q2c
  print q2d
  print q4
  print q5
  print q6
  print q7a
  print q7c
  print $ isPalindrome "foobar" == False
  print $ isPalindrome "bob" == True
  print $ myAbs 1 == 1
  print $ myAbs (-8) == 8
  print $ f (1, 2) (3, 4) == ((2, 4), (1, 3))
