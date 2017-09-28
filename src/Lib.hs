module Lib
    ( someFunc
    ) where

import RPN

someFunc :: IO ()
someFunc = do
    xs <- getLine
    putStr ">> "
    let exp = words xs
     in print $ eval $ parse exp
    someFunc
