module Lesson5 where

import Prelude hiding (concat, (++), zip)

concat :: [[a]] -> [a]
concat [] = []
concat [x] = x
concat (x:xs) = x ++ concat xs

(++) :: [a] -> [a] -> [a]
(++) [] [] = []
(++) xs [] = xs
(++) [] ys = ys
(++) (x:xs) ys = x : (++) xs ys

zip :: [a] -> [b] -> [(a, b)]
zip [] [] = []
zip xs [] = []
zip [] ys = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys

fact :: Int -> Int
fact n = factH n 1 where
    factH 0 x = x
    factH y x = factH (y-1) (y*x)

pow :: Int -> Int -> Int
pow n m = powH n m 1 where
    powH x 0 z = z
    powH x y z = powH x (y-1) (x*z)

drop :: Int -> [a] -> [a]
drop 0 l = l
drop _ [] = []
drop n l@(x:xs)
  | n < 0 = l
  | otherwise = drop (n-1) xs

-- [] --> üres lista
-- [x] --> pontosan egy elemű
-- (xs:x) --> legalább 1 elemű
-- [a, (x,y), _a]
-- ([d]:[ds]) --> [[d], ds]