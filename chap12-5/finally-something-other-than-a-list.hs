main :: IO ()

data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)


unfold :: (a -> Maybe (a,b,a))
       -> a
       -> BinaryTree b

unfold f x =
  case f x of
    Nothing -> Leaf
    Just(a, b, c) -> Node (unfold f a) b (unfold f c)


treeBuild :: Integer -> BinaryTree Integer
treeBuild 0 = Leaf
treeBuild n = unfold subtractTillZero n

subtractTillZero 0 = Nothing
subtractTillZero n = Just (n-1, n-1, n-1)

main = do
  print $ treeBuild 0
  print $ treeBuild 1
  print $ treeBuild 2
