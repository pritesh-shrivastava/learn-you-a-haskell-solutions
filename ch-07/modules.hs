import Data.List 
import Data.Char
import Data.Map
import Data.Set 
    
numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub  

-- Caesar cipher - shift characters by a constant 
encode :: Int -> String -> String  
encode shift msg = 
    let ords = map ord msg  
        shifted = map (+ shift) ords  
    in  map chr shifted  
-- alternative implementation
-- map (chr . (+ shift) . ord) msg


-- Given a list of key value pairs, find the value v matching key k
-- phoneBook =   
--    [("betty","555-2938")      ,("bonnie","452-2928")      ,("patsy","493-2928")      
--    ,("lucille","205-2928")      ,("wendy","939-8282")     ,("penny","853-2492")      ]  
findKey :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey key [] = Nothing  
findKey key ((k,v):xs) = if key == k  
                         then Just v  
                         else findKey key xs 

-- alternative implementation using a fold
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing  