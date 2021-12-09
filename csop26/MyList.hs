module MyList where

data List a = Nil | Cons a (List a)

data Day = Het | Ked
 
instance Show Day where
  show Het = "Hétfő"
  show Ked = "Kedd"

instance Show a => Show (List a) where
  show l = "<" ++ showInner l ++ ">" where
    showInner Nil = ""
    showInner (Cons x Nil) = show x
    showInner (Cons x xs) = show x ++ "," ++ showInner xs