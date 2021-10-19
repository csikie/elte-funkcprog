module Lesson6 where

-- Elérési kód: otodik

{-
    [] --» üres lista
    [x] --» egy elemű lista
    (xs:x) --» legalább egy elemű lista
    ([]:[]) --» üres lista
    (x:y:[]) == x:[y] == [x,y] --» pontosan két elemű lista
    [(x,_)] --» egy elemű lista, amely tuplet tartalmaz
    [xs:ys:_] --» egy elemű lista, amely egy legalább két elemű listát tartalmaz
    [_,_:xs] --» egy két elemű lista, aminek a második eleme egy legalább egy elemű lista
    [a, (x,y), _a] --» egy 3 elemű lista, ami tupleket tartalmaz
    (c:cs:[(x,xs)]) --» u.a mint egyel feljebb
    ([d]:[ds]) == [[d], ds] --» két elemű lista, aminek az első eleme egy egy elemű lista 
 -}

--type Point = (Int, Int)

newtype MyPoint = P (Int, Int)
    deriving (Show)

data MyPoint' = P' (Int, Int)
    deriving (Show)

-- data Bool = True | False

data Day = Het | Ked | Sze | Csu | Pen | Szo | Vas
    deriving (Show)

isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek Het = True
isFirstDayOfWeek _ = False

isWeekend :: Day -> Bool
isWeekend Szo = True
isWeekend Vas = True
isWeekend _ = False

data Time = T (Int, Int)
-- deriving (Eq)

showTime :: Time -> String -- T (12,15) --> "12.15", show :: a -> String
showTime (T (ora, perc)) = show ora ++ "." ++ show perc

eqTime :: Time -> Time -> Bool -- eqTime (T (1,15)) (T (1,15)) == True
--eqTime (T (a,b)) (T (c,d)) = a == c && b == d
--eqTime a b = a == b
eqTime (T a) (T b) = a == b