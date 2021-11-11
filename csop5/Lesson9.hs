module Lesson9 where

import Data.List hiding (iterate)
import Prelude hiding (iterate)

dropSpaces :: String -> String
dropSpaces s = dropWhile (==' ') s

-- "   Hello World!    "
trim :: String -> String
trim s = reverse (dropSpaces (reverse (dropSpaces s)))

-- "Jim Carrey" == "J. C."
monogram :: String -> String
monogram s = unwords (map f (words s))  where
    f (x:_) = [x, '.']

uniq :: Ord a => [a] -> [a]
uniq s = map head (group (sort s))

repeated :: Ord a => [a] -> [a]
repeated s = map head (filter p (group (sort s))) where
    p l = length l > 1 

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

dotProduct :: [Int] -> [Int] -> Int
dotProduct l1 l2 = sum (zipWith (*) l1 l2)

iterate :: (a -> a) -> a -> [a]
iterate = undefined

fibonacci :: [Int]
fibonacci = undefined