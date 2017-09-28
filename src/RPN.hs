module RPN 
    (parse, eval
    ) where

data Exp = 
    Num Int
      | Plus Exp Exp
      | Sub Exp Exp
      | Mul Exp Exp
      | Div Exp Exp
      deriving (Show, Eq)

parse :: []String -> Exp
parse exp = iParse exp []
    where iParse [] res = head res
          iParse (x:xs) st
            | x == "+" =  iParse xs $ (Plus (head $ tail st) (head st)):(tail $ tail st)
            | x == "-" =  iParse xs $ (Sub  (head $ tail st) (head st)):(tail $ tail st)
            | x == "*" =  iParse xs $ (Mul  (head $ tail st) (head st)):(tail $ tail st)
            | x == "/" =  iParse xs $ (Div  (head $ tail st) (head st)):(tail $ tail st)
            | otherwise = iParse xs $ (Num  (read x :: Int)):st

eval :: Exp -> Int
eval (Plus exp1 exp2) = eval exp1 + eval exp2
eval (Sub exp1 exp2)  = eval exp1 - eval exp2
eval (Mul exp1 exp2)  = eval exp1 * eval exp2
eval (Div exp1 exp2)  = eval exp1 `div` eval exp2
eval (Num x)          = x
