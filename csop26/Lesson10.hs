module Lesson10 where

import Data.List

-- (\n0 (n:ns) (x, _) ... -> n+1)

repeated :: Ord a => [a] -> [a]
repeated l = map head (filter (\s -> length s > 1) (group (sort l)))

monogram :: String -> String -- unwords - words | monogram "Jim Carrey" == "J. C."
monogram s =  unwords (map (\(x:_) -> [x, '.']) (words s))

-- iterate (\n -> n * 2) 1 == [1, 2, 4, 8, 16, ...]
iterate'' :: (a -> a) -> a -> [a]
iterate'' f e = e : iterate'' f (f e)

-- 0 1 1 2 3 5 8 13 ...| map fst (iterate ? (0, 1))
fibonacci :: [Integer]
fibonacci = map fst (iterate (\(x, y) -> (y, x+y)) (0, 1))

-- (1+(2+(3+(4+(5+(6+(7+(8+(9+(10+0)))))))))) foldr (+) 0 [1..10]
foldR :: (a -> b -> b) -> b -> [a] -> b
foldR _ e [] = e
foldR f e (x:xs) = f x (foldR f e xs)

-- ((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10)
foldL :: (b -> a -> b) -> b -> [a] -> b
foldL _ e [] = e
foldL f e (x:xs) = foldL f (f e x) xs

sum' :: Num a => [a] -> a
sum' l = foldl (+) 0 l

length' :: [a] -> Int
length' l = foldl (\c _ -> c+1) 0 l