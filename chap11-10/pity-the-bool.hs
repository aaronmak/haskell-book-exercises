import Data.Int
main :: IO ()

data BigSmall =
    Big Bool
  | Small Bool
  deriving (Eq, Show)


-- Big Bool | Small Bool = ??
-- Big (True | False) | Small (True | False) = ??
-- 2 + 2 = 4

data NumberOrBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

myNumba = Numba (-128)

-- Numba Int8 | BoolyBool Bool = ??
-- Numba 256 | BoolyBool 2 = ??
-- 256 + 2 = 258


main = print "foo"
