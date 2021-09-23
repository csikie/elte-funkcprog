module Lesson3 where

-- [elem amit vissza adunk (x) | (x <- lista, y <- lista2, ... z <- listan), logikai feltetel]

powerOfTwo :: [Int]
powerOfTwo = [2^x | x <- [0..10]]

evens :: [Int] -> [Int]
evens l = [x | x <- l, even x]

allPositive :: [Int] -> Bool
allPositive l = null [x | x <- l, x <= 0]

dominoes :: [(Int, Int)]
dominoes = [(x,y) | x <- [0..6], y <- [x..6]]

alphabet :: [(Int, Char)]
alphabet = zip [0..] ['a'..'z']

--type String = [Char], ['a','b'] == "ab"

everyThird :: String
everyThird = [ y | (x, y) <- zip [1..] ['a'..'z'], mod x 3 == 0]

courses :: [(String, [(String, String, String)])]
courses = [("Programozasi nyelvek II.", [("Horvath", "Istvan", "BDE91E"), ("Fodros", "Aniko", "DDA3KX")]), 
           ("Imperativ programozas", [("Nemeth", "Eniko", "ALX1K0"), ("Horvath", "Istvan", "BDE91E")]),
           ("Funkcionalis programozas", [("Kiss", "Elemer", "ABCDE6"), ("Nagy", "Jakab", "CDE560")])]

students :: [String]
students = [y | (x, l) <- courses, (_, _, y) <- l, x == "Funkcionalis programozas"]