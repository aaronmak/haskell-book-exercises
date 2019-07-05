main :: IO ()

-- 1

-- data Person = Person Bool
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2

data Mood = Blah
          | Woot deriving Show

instance Eq Mood where
  x == x' = True

settleDown x = if x == Woot
                 then Blah
                 else x

-- 3
-- a) Woot or Blah - Mood Type
-- b) settleDown 9 will fail because it expected type 'Mood'
-- c) It will fail because there is no instance for (Ord Mood)

-- 4

type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- s1 would type check because it is a partial function
-- s1 needs Object to form a Sentence.
-- s2 wouild work

main = print "it typechecks"
