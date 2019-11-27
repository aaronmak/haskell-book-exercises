main :: IO ()

data Expr
   = Lit Integer
   | Add Expr Expr

eval :: Expr -> Integer
eval (Lit i) = i
eval (Add x y) = (eval x) + (eval y)

printExpr :: Expr -> String
printExpr (Lit i) = show i
printExpr (Add x y) = (printExpr x) ++ " + " ++ (printExpr y)


main = do
  print $ eval (Add (Lit 1) (Lit 9001))
  print $ printExpr (Add (Add (Lit 1) (Lit 9001)) (Lit 1))
