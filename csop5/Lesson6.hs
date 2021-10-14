module Lesson6 where

{-
    [] --» üres lista
    [x] == (x:[]) --» pontosan egy elemű lista
    (xs:x) --» legalább egy elemű lista
    ([]:[]) --» üres lista
    (x:y:[]) --» pontosan két elemű lista
    [(x,_)] --» egy elemű lista, amely tupleket tartalmaz
    [xs:ys:_] --» egy elemű lista, amely egy legalább két elemű listát tartalmaz
    [_,_:xs] --» egy lista, aminek két eleme van és a második elem egy legalább egy elemű lista
    [a,(x,y),_a] --» 3 elemű lista, ami tupleket tartalmaz
    (c:cs:[(x,xs)]) --» u.a. mint egyel feljebb
    ([d]:[ds]) --> [d]:[ds] --> [[d], ds] --» két elemű lista, aminek az első eleme egy egy elemű lista
-}

newtype MyPoint = P (Int, Int)
    deriving (Show)

data MyPoint' = P' (Int, Int)
    deriving (Show)

-- data Bool = True | False 

translate :: (Int, Int) -> MyPoint -> MyPoint
translate (x,y) (P (x', y')) = P (x+x',y+y') 

data Day = Hetfo | Kedd | Szerda | Csutortok | Pentek | Szombat | Vasarnap
    deriving (Show)

isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek Hetfo = True
isFirstDayOfWeek _ = False

isWeekend :: Day -> Bool
isWeekend Szombat = True
isWeekend Vasarnap = True
isWeekend _ = False

data Time = T (Int, Int)
--deriving (Eq)

showTime :: Time -> String
showTime (T (ora, perc)) = show ora ++ "." ++ show perc

eqTime :: Time -> Time -> Bool
eqTime (T a) (T b) = a == b