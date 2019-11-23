import Data.Char
import Data.List
import Data.Maybe
main :: IO ()

data DaPhone = DaPhone [Button] deriving (Eq, Show)
data Button = Button Key Values deriving (Eq, Show)
data Key = Key Char deriving (Eq, Show)
data Values = Values String deriving (Eq, Show) -- (1)

phone :: DaPhone
phone = DaPhone
  [Button (Key '1') (Values ""),
   Button (Key '2') (Values "ABC"),
   Button (Key '3') (Values "DEF"),
   Button (Key '4') (Values "GHI"),
   Button (Key '5') (Values "JKL"),
   Button (Key '6') (Values "MNO"),
   Button (Key '7') (Values "PQRS"),
   Button (Key '8') (Values "TUV"),
   Button (Key '9') (Values "WXYZ"),
   Button (Key '*') (Values "^"),
   Button (Key '0') (Values " "),
   Button (Key '#') (Values ".,")]

convo :: [String]
convo =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol", "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol", "Lol ya",
   "Just making sure rofl ur turn"]

type Digit = Char

type Presses = Int

hasValue :: Char -> Button -> Bool
hasValue c (Button (Key x) (Values xs)) =
  foldl (||) False $ map (== c) xs

hasKey :: Char -> Button -> Bool
hasKey c (Button (Key x) _) = c == x

getButton :: DaPhone -> Char -> Button
getButton (DaPhone btns) x =
  head (
    (filter (hasValue $ toUpper x) btns) ++
    (filter (hasKey $ x) btns)
  )

getPresses :: Button -> Char -> [(Digit, Presses)]
getPresses (Button (Key x) (Values xs)) c
  | isNumber c = [(x, length(xs) + 1)]
  | otherwise = [(x, (fromJust $ elemIndex c xs) + 1)]

reverseTaps :: DaPhone
            -> Char
            -> [(Digit, Presses)]
reverseTaps phone x
  | isUpper x = [('*', 1)] ++ getPresses (getButton phone x) x
  | otherwise = getPresses (getButton phone x) (toUpper x)

cellPhonesDead :: DaPhone
               -> String
               -> [(Digit, Presses)]
cellPhonesDead phone [] = []
cellPhonesDead phone (x:xs) =
  [] ++ reverseTaps phone x ++ cellPhonesDead phone xs


convoTaps = map (cellPhonesDead phone) convo -- (2)

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps [] = 0
fingerTaps ((_, p):xs) = p + fingerTaps xs -- (3)

mostPopularLetter :: String -> Char
mostPopularLetter xs =
  head $ snd $
  last $ sort $ map lengthListTup $
  group $ sort $ removeSpaces xs

removeSpaces xs = filter (/= ' ') xs

convoPopularLetters = map mostPopularLetter convo

lengthListTup :: [a] -> (Int, [a])
lengthListTup xs = (length xs, xs)

charCost :: Char -> Presses
charCost x = fingerTaps $ reverseTaps phone x

flatten :: [String] -> String
flatten [] = []
flatten (x:xs) = x ++ [' '] ++ flatten xs

coolestLtr :: [String] -> Char
coolestLtr xs = mostPopularLetter $ flatten xs

coolestWord :: [String] -> String
coolestWord xs = head $ snd $ last $ sort $ map lengthListTup $ group $ sort $ words $ flatten xs

main = do
  print $ convoTaps
  print $ map fingerTaps $ convoTaps
  print $ convoPopularLetters
  print $ map charCost convoPopularLetters
  print $ coolestLtr convo
  print $ coolestWord convo
