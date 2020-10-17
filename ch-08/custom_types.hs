-- Algebraic data types combine several different kinds of types

-- Common Example of Algebraic data types is the singly linked list
data List a = Nil | Cons a (List a)



data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)  

-- Shape is the data type, Circle & Rectangle are value constructors, which are actually just functions.
-- deriving Show helps to print the value of the type


-- Alternate way of defining types using record syntax
data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)  


-- Type constructors - like Maybe. It is not a data type, but a type constructor
data Maybe a = Nothing | Just a  


-- These functions can operate on types of Vector Int, Vector Integer, Vector Float, 
-- whatever, as long as the a from Vector a is from the Num typeclass. 
data Vector a = Vector a a a deriving (Show)  
    
vplus :: (Num t) => Vector t -> Vector t -> Vector t  
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
    
vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
    
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  