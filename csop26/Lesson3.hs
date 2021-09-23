module Lesson3 where

import Data.Char

--type String = [Char]
-- [elem amit beleteszunk az eredmeny listaba (x) | (x <- lista , y <- lista2, ..., n <- listan), logikai feltetelek (mod x 3 == 0)]

powerOfTwo :: [Int]
powerOfTwo = [2^x | x <- [0..10]]

evens :: Int -> [Int]
evens n = [x | x <- [1..n], even x]

allPositive :: [Int] -> Bool
allPositive l = null [x | x <- l, x <= 0]

dominoes :: [(Int, Int)]
dominoes = [(x, y) | x <- [0..6], y <- [x..6]]

alphabet :: [(Int, Char)]
alphabet = zip [0..] ['a'..'z']

everyThird :: String
everyThird = [y | (x, y) <- zip [1..] ['a'..'z'], mod x 3 == 0]

toUpperAll :: String -> String
toUpperAll s = [toUpper x | x <- s]

courses :: [(String, [(String, String, String)])]
courses = [("Programozasi nyelvek II.", [("Horvath", "Istvan", "BDE91E"), ("Fodros", "Aniko", "DDA3KX")]), 
           ("Imperativ programozas", [("Nemeth", "Eniko", "ALX1K0"), ("Horvath", "Istvan", "BDE91E")]), 
           ("Funkcionalis programozas", [("Kiss", "Elemer", "ABCDE6"), ("Nagy", "Jakab", "CDE560")])]

students :: String -> [String]
students s = [ y | (x, l) <- courses, (_, _, y) <- l, x == s]