module Lesson4 where

sum' :: [Int] -> Int
sum' [] = 0
sum' [x] = x
sum' (h:t) = h + sum' t

{-
    [1,2,3]
    1 + (sum' [2,3])
    1 + (2 + sum' [3])
    1 + (2 + (3 + sum' []))

    range 5 9 == [5, 6, 7, 8, 9]
    range 5 5 == [5]
    range 0 3 == [0, 1, 2, 3]

    pow 0 2 == 0
    pow 2 0 == 1
    pow 2 1 == 2
    pow 3 2 == 9
-}

len :: [a] -> Int
len [] = 0
len [x] = 1
len (_:xs) = 1 + len xs

replaceFirst :: Char -> Char -> String -> String
replaceFirst _ _ "" = ""
replaceFirst old new (x:xs)
  | x == old = new : xs
  | otherwise = x : replaceFirst old new xs 

range :: Int -> Int -> [Int]
range x y
  | x < y = x : range (x+1) y
  | otherwise = x : []

pow :: Int -> Int -> Int
pow 0 0 = 1
pow 0 _ = 0
pow _ 0 = 1
pow x y = x * pow x (y-1)

everySecond :: [a] -> [a]
everySecond [] = []
everySecond [x] = []
everySecond (_:h:t) = h : everySecond t

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs)
  | x == e = True
  | otherwise = elem' e xs 