import Data.Monoid
main :: IO ()

data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  Nada <> (Only a) = Only a
  (Only a) <> Nada = Only a
  (Only a) <> (Only b)  = Only (a <> b)
  Nada <> Nada = Nada

instance Monoid a
      => Monoid (Optional a) where
  mempty = Nada


onlySum = Only (Sum 1)

main = do
  print $ Nada `mappend` onlySum
  print $ onlySum `mappend` onlySum
