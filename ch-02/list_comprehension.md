You write list comprehensions like Math in the ghci interpreter !!

```
[x*2 | x <- [1..10]] 

length' xs = sum [1 | _ <- xs] 

rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  
```