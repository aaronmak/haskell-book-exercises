main :: IO ()


data Example = MakeExample deriving Show
-- :t Example will fail: data constructor not in scope

data ExampleNew = MakeExampleNew Int deriving Show

main = print "foo"
