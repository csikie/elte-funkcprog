module Lesson11 where

-- (1+(2+(3+(4+(5+(6+(7+(8+(9+(10+0)))))))))) foldr

foldR :: (a -> b -> b) -> b -> [a] -> b
foldR _ e [] = e
foldR f e (x:xs) = f x (foldR f e xs)

-- ((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10) foldl
foldL :: (b -> a -> b) -> b -> [a] -> b
foldL _ e [] = e
foldL f e (x:xs) = foldL f (f e x) xs

sum' :: Num a => [a] -> a
sum' l = foldl (+) 0 l

product' :: Num a => [a] -> a
product' l = foldl (*) 1 l

and' :: Foldable t => t Bool -> Bool
and' l = foldl (&&) True l

concat' :: Foldable t => t [a] -> [a]
concat' l = foldl (++) [] l

length' :: Foldable t => t a -> Int
length' l = foldl (\c _ -> c + 1) 0 l

-- [1,2,5,4] == [1,2,4,5]

-- 1: insert => 4 [1,2,5,3] == [1,2,4,5,3]
-- 2: foldr insert 

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x l@(y:ys)
  | x < y = x : l
  | otherwise = y : insert x ys

isort :: Ord a => [a] -> [a]
isort l = foldr insert [] l