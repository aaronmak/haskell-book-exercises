main :: IO ()

eftBool :: Bool -> Bool -> [Bool]
eftBool x y =
  if x /= y
  then  [x, y]
  else  [x]

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd x y = go [] x y
  where go store x y
         | x > y = store
         | x == GT = store ++ [GT]
         | otherwise =
            go (store ++ [x]) (succ x) y

eftInt :: Int -> Int -> [Int]
eftInt x y = go [] x y
  where go store x y
         | x > y = store
         | otherwise =
            go (store ++ [x]) (succ x) y

eftChar :: Char -> Char -> [Char]
eftChar x y = go [] x y
  where go store x y
         | x > y = store
         | otherwise =
            go (store ++ [x]) (succ x) y

main = do
  print $ eftBool True False
  print $ eftOrd LT LT
  print $ eftOrd LT EQ
  print $ eftOrd LT GT
  print $ eftOrd EQ EQ
  print $ eftOrd EQ GT
  print $ eftOrd GT GT
  print $ eftInt 1 5
  print $ eftChar 'A' 'c'
