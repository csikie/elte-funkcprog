module Lesson9 where

import Data.List

dropSpaces :: String -> String
dropSpaces s = dropWhile (==' ') s

trim :: String -> String -- reverse
trim s =  reverse (dropSpaces (reverse (dropSpaces s)))

monogram :: String -> String -- unwords - words | monogram "Jim Carrey" == "J. C."
monogram s =  unwords (map f (words s)) where
    f (x:_) = [x, '.']

uniq :: Ord a => [a] -> [a]
uniq l = map head (group (sort l))

repeated :: Ord a => [a] -> [a]
repeated l = map head (filter p (group (sort l))) where
    p s = length s > 1

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

dotProduct :: [Int] -> [Int] -> Int
dotProduct l1 l2 = sum (zipWith' (*) l1 l2)