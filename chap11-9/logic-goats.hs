{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
main :: IO ()

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where
  tooMany (n, xs) = (n > 42) && (length xs > 5)

instance TooMany (Int, Int) where
  tooMany (n, m) = (n + m) > 42

-- instance TooMany (Num a, TooMany a) => (a, a) where
--   tooMany (x, y) = True
-- FIXME: Not sure how to fix this

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

main = do
  print $ tooMany (Goats 42)
