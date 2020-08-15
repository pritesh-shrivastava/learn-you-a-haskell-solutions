maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs)   
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maximum' xs  
    -- A more elegant solution
    -- maximum' (x:xs) = max x (maximum' xs)

-- replicate x n times in a list
replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x  

-- In Haskell, unlike SML, the cons operator to a list is :, not ::


-- take n elements from a list. Notice n & xs are curried parameters.
-- We can't pattern match on them directly
-- Hence, we have simply defined the function for 3 condtions separately !!
take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs


-- Reversing a list. The list append operator used here is ++
reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]  

-- Infinite lists are not a problem in Haskell so not giving a base condition is OK
repeat' :: a -> [a]  
repeat' x = x:repeat' x

-- Notice no pattern matching using case or gaurds. 
-- Just typing out different function definitions for differnt patterns 
zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool  
elem' a [] = False  
elem' a (x:xs)  
    | a == x    = True  
    | otherwise = elem' a xs


-- Quicksort implementation in Haskell. O(n log n)
-- Using the head as pivot
quicksort [] = []  
quicksort (x:xs) =   
    smallerSorted ++ [x] ++ biggerSorted
    where   smallerSorted = quicksort [a | a <- xs, a <= x]  
            biggerSorted = quicksort [a | a <- xs, a > x]  
    
-- Can use let as well
-- Example
sorted = quicksort "the quick brown fox jumps over the lazy dog"