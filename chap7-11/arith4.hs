module Arith4 where

roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
roundTrip a = read . show $ a

roundTrip' :: (Show a, Read b) => a -> b
roundTrip' a = read (show a)

main = do
  print (roundTrip 4)
  print (id 4)
  print (roundTrip' 4 :: Int)
