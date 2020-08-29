module Main where

import Data.Char
import System.IO
import Hangman (freshPuzzle, randomWord', runGame)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  word <- randomWord'
  let puzzle =
        freshPuzzle (fmap toLower word)
  runGame puzzle
