factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)

-- Function factorial has typeclass constraint on variable a. It takes integral values only.
-- Takes a polymorphic data of typeclass Integral and returns the same polymorphic data type
-- The polymorphic variable a can have types Int (small int) or Integer (large integer) 


addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 +y2)

-- In this case, the data type a can be Int, Integer, Float or Double 
-- as all these 4 types belong to the typeclass Num

head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"  
head' (x:_) = x  


tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  


-- defining lenght function without typeclasses
length' :: [a] -> Int
length' [] = 0  
length' (_:xs) = 1 + length' xs  

