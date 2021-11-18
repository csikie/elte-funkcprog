module Lesson10 where

import Data.List

-- take 5 (iterate (*2) 1) == [1, 2, 4, 8, 16]
-- (\n0 n1 .. n_n -> fuggveny torzs)
-- (\n -> n+1)
-- (\x y -> x + y)
-- (\(x:_) -> x)

-- 0 1 1 2 3 5 8 ...

iterate'' :: (a -> a) -> a -> [a]
iterate'' f e = e : iterate'' f (f e)

fibonacci :: [Integer]
fibonacci = map fst (iterate (\(x,y) -> (y, x+y)) (0,1))

repeated :: Ord a => [a] -> [a]
repeated s = map head (filter (\l -> length l > 1) (group (sort s)))

monogram :: String -> String
monogram s = unwords (map (\(x:_) -> [x, '.']) (words s))

-- (1+(2+(3+(4+(5+(6+(7+(8+(9+(10+0))))))))))
foldR :: (a -> b -> b) -> b -> [a] -> b
foldR _ e [] = e
foldR f e (x:xs) = f x (foldR f e xs)

-- ((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10)
foldL :: (b -> a -> b) -> b -> [a] -> b
foldL _ e [] = e
foldL f e (x:xs) = foldL f (f e x) xs

sum' :: Num a => [a] -> a
sum' l = foldl (+) 0 l

product' :: Num a => [a] -> a
product' l = foldl (*) 1 l 

and' :: [Bool] -> Bool
and' l = foldl (&&) True l

length' :: [a] -> Int
length' l = foldl (\c _ -> c+1) 0 l