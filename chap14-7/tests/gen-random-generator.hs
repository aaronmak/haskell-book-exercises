import Test.QuickCheck

main :: IO ()

data Fool =
     Fulse
   | Frue
   deriving (Eq, Show)


foolGenEqual :: Gen (Fool)

foolGenEqual = do
  oneof [return $ Fulse,
         return $ Frue]


foolGenTwoFulseOneFrue :: Gen (Fool)
foolGenTwoFulseOneFrue = do
  frequency [(2, return Fulse),
             (1, return Frue)]


main = do
  print "---Q1---"
  sample foolGenEqual
  print "---Q2---"
  sample foolGenTwoFulseOneFrue
