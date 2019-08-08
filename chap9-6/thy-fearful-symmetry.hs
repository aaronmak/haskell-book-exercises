main :: IO ()


-- myWords x = go [] x
--   where go store x
--          | (takeWhile(/=' ') x) == "" = store
--          | otherwise =
--             go (store ++ [takeWhile(/=' ') x]) (dropWhile(==' ') $ dropWhile(/=' ') x)

myWords x = mySplit x ' '

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
-- myLines x = go [] x
--   where go store x
--          | (takeWhile(/='\n') x) == "" = store
--          | otherwise =
--             go (store ++ [takeWhile(/='\n') x]) (dropWhile(=='\n') $ dropWhile(/='\n') x)

myLines x = mySplit x '\n'

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?" ]

mySplit sentences splitOn = go [] sentences splitOn
  where go store x c
         | (takeWhile(/=c) x) == "" = store
         | otherwise =
            go (store ++ [takeWhile(/=c) x]) (dropWhile(==c) $ dropWhile(/=c) x) c

main = do
  print $ myWords "foo bar foobar"
  print $
    "Are they equal? "
    ++ show (myLines sentences == shouldEqual)
