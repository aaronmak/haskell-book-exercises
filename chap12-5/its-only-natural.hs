main :: IO ()


data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat x
  | x < 0 = Nothing
  | otherwise = Just $ toNat x

toNat :: Integer -> Nat
toNat 0 = Zero
toNat x = Succ $ toNat (x - 1)


main = do
  print $ natToInteger Zero
  print $ natToInteger (Succ Zero)
  print $ natToInteger (Succ (Succ Zero))
  print $ integerToNat (-1)
  print $ integerToNat 0
  print $ integerToNat 1
  print $ integerToNat 2
