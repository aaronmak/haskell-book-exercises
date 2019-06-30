main :: IO ()

data Mood = Blah | Woot deriving Show


-- 1: Mood type

-- 2: Accepts either Blah or Woot

-- 3

-- changeMood :: Mood -> Woot is wrong because
-- it needs to be type -> type
changeMood :: Mood -> Mood

-- 4

changeMood Blah = Woot
changeMood    _ = Blah


main = print (changeMood Blah)
