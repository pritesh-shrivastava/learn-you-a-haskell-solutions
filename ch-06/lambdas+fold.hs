-- Both expressions are same
-- map (+3) [1,6,3,2]          -- Partial application
-- map (\x -> x + 3) [1,6,3,2] -- lambda
-- Partial application is more readable

-- These 2 are again similar
addThree :: (Num a) => a -> a -> a -> a  
-- addThree x y z = x + y + z   
addThree = \x -> \y -> \z -> x + y + z  


flip' :: (a -> b -> c) -> b -> a -> c  
flip' f = \x y -> f y x
-- flip' f x y = f y x


-- These 2 are the same
sum' :: (Num a) => [a] -> a  
-- sum' = foldl (+) 0 
sum' xs = foldl (\acc x -> acc + x) 0 xs  


-- Left vs Right fold
map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
-- Cons is computationally cheaper than append (++). Hence, right fold is preferred while building lists

-- foldl1 & foldr1 assume non-empty lists & don't need an accumulater starting value
-- 1st or last elem of the list is the starting val for accumulator

maximum' :: (Ord a) => [a] -> a  
maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
  
reverse' :: [a] -> [a]  
reverse' = foldl (\acc x -> x : acc) []  
  
product' :: (Num a) => [a] -> a  
product' = foldr1 (*)  
  
filter' :: (a -> Bool) -> [a] -> [a]  
filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
  
head' :: [a] -> a  
head' = foldr1 (\x _ -> x)  
  
last' :: [a] -> a  
last' = foldl1 (\_ x -> x)

-- $ is like a left & right bracket for whatever comes to the right of it
-- sum (filter (> 10) (map (*2) [2..10]))
-- sum $ filter (> 10) $ map (*2) [2..10]
-- are the same. We can avoid a lot of brackets with $


-- Function composition
-- In SML, we f o g
f . g = \x -> f (g x)  
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]  
-- => [-14,-15,-27]  

-- Function composition helps to write functions in the point free style, ie without argument
-- for eg, the val binding instead of fun binding in SML
--fn x = ceiling (negate (tan (cos (max 50 x))))
fn = ceiling . negate . tan . cos . max 50

