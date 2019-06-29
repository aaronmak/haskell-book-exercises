main :: IO ()

-- Reading Syntax
-- 1

q1a = concat [[1, 2, 3], [4, 5, 6]]

-- ++ [1, 2, 3] [4, 5, 6]
q1b = (++) [1, 2, 3] [4, 5, 6]

q1c = (++) "hello" " world"

q1d = ["hello" ++ " world"]

-- 4 !! "hello"
q1e = "hello" !! 4

q1f = (!!) "hello" 4

-- take "4 lovely"
q1g = take 4 "lovely"

q1h = take 3 "awesome"

-- 2

q2a = concat [[1 * 6], [2 * 6], [3 * 6]] == [6, 12, 18]
q2b = "rain" ++ drop 2 "elbow" == "rainbow"
q2c = 10 * head [1, 2, 3] == 10
q2d = (take 3 "Julie") ++ (tail "yes") == "Jules"
q2e = concat [tail [1, 2, 3],
              tail [4, 5, 6],
              tail [7, 8, 9]] == [2, 3, 5, 6, 8, 9]

-- Building Functions

-- 1

one_a = "Curry is awesome" ++ "!" == "Curry is awesome!"
one_b = "Curry is awesome!" !! 5 : "" == "y"
one_c = drop 9 "Curry is awesome!" == "awesome!"

-- 2

addExclamation x = x ++ "!"
fifthInList x = x !! 5 : ""
dropNine x = drop 9 x

-- 3

thirdLetter :: [Char] -> Char
thirdLetter x = x !! 2

three = thirdLetter "four" == 'u'

-- 4

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

four = letterIndex 0 == 'C'

-- 5 & 6

rvrs :: String -> String
rvrs x = drop 9 x ++ drop 5 (take 9 x) ++ take 5 x
five = rvrs "Curry is awesome" == "awesome is Curry"

main = do
  putStrLn (show q2a)
  putStrLn (show q2b)
  putStrLn (show q2c)
  putStrLn (show q2d)
  putStrLn (show q2e)
  putStrLn (show three)
  putStrLn (show four)
  putStrLn (show five)
  print $ five
