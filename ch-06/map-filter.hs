map' :: (a -> b) -> [a] -> [b]  
map' _ [] = []  
map' f (x:xs) = f x : map' f xs



filter' :: (a -> Bool) -> [a] -> [a]  
filter' _ [] = []  
filter' p (x:xs)   
    | p x       = x : filter' p xs  
    | otherwise = filter' p xs  


quicksort :: (Ord a) => [a] -> [a]    
quicksort [] = []    
quicksort (x:xs) =     
    let smallerSorted = quicksort (filter' (<=x) xs)  
        biggerSorted = quicksort (filter' (>x) xs)   
    in  smallerSorted ++ [x] ++ biggerSorted  


-- Let's find the largest number under 100,000 that's divisible by 3829. 
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter' p [100000,99999..])  
    where p x = x `mod` 3829 == 0
-- This is an infinite list, yet due to Haskell's laziness, 
-- evalutation will stop once we find the head ie first element that satisfies the filter


-- find the sum of all odd squares that are smaller than 10,000
sumOddSq = sum (takeWhile (<10000) (map (^2) [1, 3..]) )
-- Alternately, using list comprehension
-- sum (takeWhile (<10000) [n^2 | n <- [1..], odd n])


-- Collatz sequences : We take a natural number. If that number is even, we divide it by two. 
-- If it's odd, we multiply it by 3 and then add 1 to that. 
-- We take the resulting number and apply the same thing to it, and so on. In essence, we get a chain of numbers. 
-- It is thought that for all starting numbers, the chains finish at the number 1.
-- CollatzChain :: (Integral a) => a -> [a]
collatzChain 1 = [1]
collatzChain x 
    |   even x = x:collatzChain (x `div` 2)  -- Need integer division, hence div not /
    |   odd x = x:collatzChain (3*x+1)

-- for all numbers between 1 and 100, how many Collatz Chains have a length greater than 15?
numLongChains :: Int  
numLongChains = length (filter isLong (map chain [1..100]))  
    where isLong xs = length xs > 15