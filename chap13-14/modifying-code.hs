import Control.Monad
import Data.Char
import System.Exit (exitSuccess)

-- Q2 & 3

lowerSentence :: [Char] -> [Char]
lowerSentence [] = []
lowerSentence (x:xy) = [toLower x] ++ lowerSentence xy

removeNonLetters :: [Char] -> [Char]
removeNonLetters [] = []
removeNonLetters (x:xy) = case isLetter x of
                            False -> removeNonLetters xy
                            True -> [x] ++ removeNonLetters xy

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  let cleanLine = removeNonLetters $ lowerSentence line1
  case (cleanLine == reverse cleanLine) of
    True -> putStrLn "It's a palindome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess

-- main = palindrome

-- Q4

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
     NameEmpty
   | AgeTooLow
   | PersonInvalidUnknown String
   deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 =
      Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnknown $
        "Name was: " ++ show name ++
        " Age was: " ++ show age

isPerson :: Either PersonInvalid Person -> Bool
isPerson (Left _) = False
isPerson (Right _) = True

getPerson :: Either PersonInvalid Person -> Person
getPerson (Right x) = x

getPersonInvalid :: Either PersonInvalid Person -> PersonInvalid
getPersonInvalid (Left x) = x


gimmePerson :: IO ()
gimmePerson = do
  putStrLn "What is your name?"
  nameInput <- getLine
  putStrLn "What is your age?"
  ageInput <- getLine
  let person = mkPerson nameInput (read ageInput :: Integer)
  case (isPerson person) of
    True -> putStrLn ("Yay! Successfully got a person: " ++ show (getPerson person))
    False -> putStrLn ("An error occured: " ++ show (getPersonInvalid person))

main = gimmePerson
