module HangmanTest where

import Data.Maybe
import Test.QuickCheck
import Test.QuickCheck.Monadic
import Test.Hspec
import Hangman

main :: IO ()

filledIn :: Puzzle -> String
filledIn (Puzzle _ xs _) = catMaybes xs

hasCharacterFilled :: String -> Bool
hasCharacterFilled "" = True
hasCharacterFilled w@(x:xs) = do
  (length $ (filledIn $ fillInCharacter (freshPuzzle w) x)) > 0

hasPuzzleNoChange :: Char -> IO Bool
hasPuzzleNoChange x = do
  let pz = Puzzle [x, x] [Just x, Nothing] [x]
  result <- handleGuess pz x
  expected <- return $ pz
  return $ result == expected

hasPuzzleNewGuess x y = do
  let pz = Puzzle [x] [Nothing] []
  let expected_wrong = Puzzle [x] [Nothing] [y]
  let expected_correct = Puzzle [x] [Just x] [y]

  result <- handleGuess pz y
  expected_correct <- return $ expected_correct
  expected_wrong <- return $ expected_wrong

  if x == y
  then return $ result == expected_correct
  else return $ result == expected_wrong

main = hspec $ do
  describe "fillInCharacter" $ do
    it "should fill in at least one for any charcter" $ do
      property $ \xs -> hasCharacterFilled xs
  describe "handleGuess" $ do
    it "should not change when a picked character is picked again" $ do
      property $ \x -> monadicIO $ do
        noChange <- run (hasPuzzleNoChange x)
        assert noChange
    it "should return changed puzzle when a new character is picked" $ do
      property $ \x y -> monadicIO $ do
        guessedPuzzle <- run (hasPuzzleNewGuess x y)
        assert guessedPuzzle
