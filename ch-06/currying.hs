multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z  
-- Partial application with just 1 arg
multTwoWithNine = multThree 9
-- Can call this in ghci : multTwoWithNine 2 3


compareWithHundred :: (Num a, Ord a) => a -> Ordering  
-- compareWithHundred x = compare 100 x
compareWithHundred = compare 100  


-- Partial application of infix operators using ()
divideByTen :: (Floating a) => a -> a  
divideByTen = ( / 10)  

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  
-- In ghci, applyTwice (+3) 10  => 16  

-- Higher order function - Applying f to lists xs & ys to create new list
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys  

-- ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]  => [6,8,7,9]  


flip' :: (a -> b -> c) -> (b -> a -> c)  
--flip' f = g  
--    where g x y = f y x 
flip' f x y = flip' f y x
-- ghci> flip' zip [1,2,3,4,5] "hello"  => [('h',1),('e',2),('l',3),('l',4),('o',5)]  

