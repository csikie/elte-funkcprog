module Lesson5 where

import Prelude hiding (concat, (++), zip)

concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ concat xs

(++) :: [a] -> [a] -> [a]
(++) [] [] = []
(++) x [] = x
(++) [] y = y
(++) (x:xs) y = x : (++) xs y

-- [1,2] [3,4,5] --> 1 : (2 : [3,4,5])

zip :: [a] -> [b] -> [(a, b)]
-- zip [1..] ['a'..'z']
zip [] [] = []
zip x [] = []
zip [] y = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys

fact :: Int -> Int
fact n = factH n 1 where
    factH 0 x = x
    factH y x = factH (y-1) (y*x)

pow :: Int -> Int -> Int
pow n m = powH n m 1  where
    powH x 0 z = z
    powH x y z = powH x (y-1) (x*z)


