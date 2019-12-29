main :: IO ()

-- Q1

isJust :: Maybe a -> Bool
isJust (Just x) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just x) = False

-- Q2

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x f (Just y) = f y
mayybee x f Nothing = x

-- Q3

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe x (Just y) = y

-- Q4

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

-- Q5

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Just x:xs) = [x] ++ catMaybes xs
catMaybes (Nothing:xs) = catMaybes xs

-- Q6

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs
  | length ys == length xs = Just ys
  | otherwise = Nothing
  where ys = catMaybes xs


main = do
  print $ isJust (Just 1) == True
  print $ isJust Nothing == False
  print $ isNothing (Just 1) == False
  print $ isNothing Nothing == True
  print $ mayybee 0 (+1) Nothing == 0
  print $ mayybee 0 (+1) (Just 1) == 2
  print $ fromMaybe 0 Nothing == 0
  print $ fromMaybe 0 (Just 1) == 1
  print $ listToMaybe [1, 2, 3] == Just 1
  print $ isNothing $ listToMaybe []
  print $ maybeToList (Just 1) == [1]
  print $ length(maybeToList Nothing) == 0
  print $ catMaybes [Just 1, Nothing, Just 2] == [1, 2]
  print $ length(catMaybes (take 3 $ repeat Nothing)) == 0
  print $ flipMaybe [Just 1, Just 2, Just 3] == Just [1, 2, 3]
  print $ isNothing (flipMaybe [Just 1, Nothing, Just 3]) == True
