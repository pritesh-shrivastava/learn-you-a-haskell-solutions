factorial :: Integer -> Integer  
factorial n = product [1..n] 


-- typeclasses are a superset of types, like Eq, Num, Ord, Read, Show
-- Try on GHCi `:t (==)` to check the type of operator equal to.
