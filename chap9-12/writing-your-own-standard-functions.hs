main :: IO ()

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny f [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
-- myElem e [] = False
-- myElem e (x:xs) = e == x || myElem e xs
myElem e l = any (\x -> x == e) l

myReverse :: [a] -> [a]
myReverse x = go [] x
  where go store x
         | length(x) == 0 = store
         | otherwise = go (store ++ (last x : [])) (init x)

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain x = squishMap (\x -> x) x

myMaximumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMaximumBy f (x:xs) = go f x xs
  where go f max (y:ys)
         | length(ys) == 0 = max
         | f max y /= LT = go f max ys
         | otherwise = go f y ys

myMinimumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMinimumBy f (x:xs) = go f x xs
  where go f max (y:ys)
         | length(ys) == 0 = max
         | f max y /= GT = go f max ys
         | otherwise = go f y ys

myMaximum :: (Ord a) => [a] -> a
myMaximum x = myMaximumBy compare x

myMinimum :: (Ord a) => [a] -> a
myMinimum x = myMinimumBy compare x

main = do
  print "--- start --- "
  print $ myOr [True, True] == True
  print $ myOr [False, True] == True
  print $ myOr [False] == False
  print $ myAny even [1, 3, 5] == False
  print $ myAny odd [1, 3, 5] == True
  print $ myElem 1 [1..10] == True
  print $ myElem 1 [2..10] == False
  print $ myReverse [1..5] == [5, 4, 3, 2, 1]
  print $ myReverse "blah" == "halb"
  print $ squish [[1], [2]] == [1, 2]
  print $ squishMap (\x -> [1, x, 3]) [2] == [1, 2, 3]
  print $ squishAgain [[1], [2]] == [1, 2]
  print $ myMaximumBy compare [1, 53, 9001, 10] == 9001
  print $ myMinimumBy compare [1, 53, 9001, 10] == 1
  print $ myMaximum [1, 53, 9001, 10] == 9001
  print $ myMinimum [1, 53, 9001, 10] == 1
