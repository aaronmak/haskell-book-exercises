module Cipher where

import Data.Char

caesar :: Char -> Int -> Char
caesar char n = chr $ mod (ord char + n - ord 'a') 26 + ord 'a'

unCaesar :: Char -> Int -> Char
unCaesar char n = chr $ mod (ord char - n - ord 'a') 26 + ord 'a'
