main :: IO ()

data Possibly a =
    LolNope
  | Yeppers a
  deriving (Eq, Show)

instance Functor Possibly where
  fmap _ LolNope = LolNope
  fmap f (Yeppers a) = Yeppers (f a)

main = do
  print $ fmap (++ " hi") (Yeppers "?")
  print $ fmap (++ " hi") LolNope
