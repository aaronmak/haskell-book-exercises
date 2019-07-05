main :: IO ()

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- 1

-- phew = Papu Rocks True
phew = Papu (Rocks "chases") (Yeah True)

-- 2

truth = Papu (Rocks "chomskydoz")
             (Yeah True)

-- 3

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4

-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'
-- it would not typecheck because Ord instance does not exist

main = print "it typechecks!"
