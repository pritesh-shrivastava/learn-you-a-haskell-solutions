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

-- Syntactic sugar for case expressions 
tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  


-- defining lenght function without typeclasses
length' :: [a] -> Int
length' [] = 0  
length' (_:xs) = 1 + length' xs  

-- Now, in terms of typeclasses, a similar function signature would look like this
sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs 

-- wt in kg & ht in metres
bmiTell wt ht
    | wt / ht^2 <= 18.5 = "You're underweight, you emo, you!"  
    | wt / ht^2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | wt / ht^2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!" 

-- Alternatively, instead of let, we have where
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

-- since let bindings are expressions and are fairly local in their scope, they can't be used across guards (pipes)

max' :: (Ord a) => a -> a -> a
max' a b 
    | a > b     = a
    | otherwise = b


myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

-- Pattern matching in where clause
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname 


-- Calculating a list of bmis with a list of (wt, ht) tuples
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

-- let bindings
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- let vs where bindings ??
-- let bindings are expressions themselves. where bindings aren't expressions !!
-- 4 * (let a = 9 in a + 1) + 2
-- will return 42 !
-- Can pattern match on let bindings as well
-- (let (a,b,c) = (1,2,3) in a+b+c) * 100
-- will return 600 !

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]

-- The names defined in a let inside a list comprehension are visible to 
-- the output function (the part before the |) and all predicates and sections that come after of the binding. 


head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!"
                      (x:_) -> x

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list." 
                                               xs -> "a longer list."

-- or
describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."