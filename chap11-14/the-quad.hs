main :: IO ()

data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

eQuad :: Either Quad Quad
eQuad = Left One
-- eQuad = Right One
-- eQuad = Left Two
-- eQuad = Right Two
-- eQuad = Left Three
-- eQuad = Right Three
-- eQuad = Left Four
-- eQuad = Right Four

prodQuad :: (Quad, Quad)
prodQuad = (One, One)
-- 4 * 4 = 16

funcQuad :: Quad -> Quad
funcQuad One = One
-- 4 ^ 4 = 256

prodTBool :: (Bool, Bool, Bool)
prodTBool = (True, True, True)
-- 2 * 2 * 2 = 8

gTwo :: Bool -> Bool -> Bool
gTwo True True = True
-- (2^2)^2 = 16

fTwo :: Bool -> Quad -> Quad
fTwo True One = One
-- (4 ^ 4) ^ 2 = 65536


main = print prodQuad
