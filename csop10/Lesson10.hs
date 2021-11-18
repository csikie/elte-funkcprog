module Lesson10 where

import Data.List

-- uniq "Mississippi" == "Mips"
uniq :: Ord a => [a] -> [a]
uniq l = map head (group (sort l))

repeated :: Ord a => [a] -> [a]
repeated l = map head (filter (\l -> length l > 1) (group (sort l)))

monogram :: String -> String
monogram s = unwords (map (\(x:_) -> [x, '.']) (words s))

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

-- dotProduct [1, 2] [3, 4] = (1*3) + (2*4) = 11
dotProduct :: [Int] -> [Int] -> Int
dotProduct l1 l2 = sum (zipWith (*) l1 l2)

-- iterate (*2) 1 == [1, 2, 4, 8, 16, ...]
iterate'' :: (a -> a) -> a -> [a]
iterate'' f e = e : iterate'' f (f e)

-- (\n_0 _ (n:ns) .. n_n -> head n_0)

-- 0 1 1 2 3 5 8 13 21 ...| map fst (iterate ? (0, 1))
fibonacci :: [Integer]
fibonacci = map fst (iterate (\(x,y) -> (y, x+y)) (0, 1))

-- (1+(2+(3+(4+(5+(6+(7+(8+(9+(10+0)))))))))) foldr
-- ((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10) foldl