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


-- Deriving instances of Typeclasses
data Person = Person { firstName :: String  
                        , lastName :: String  
                        , age :: Int  
                        } deriving (Eq)  

-- Since String & Int data types belong to typeclass Eq (== or /=), Person data type also belongs to Eq

-- Type synonyms
type String = [Char]
-- String is not a new data type. Just a synonym for the already existing list of Chars

-- Recursive Data Structures
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)  

-- Binary Search Tree
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)  

singleton :: a -> Tree a  
singleton x = Node x EmptyTree EmptyTree  

-- Inserting an element into a binary search tree    
treeInsert :: (Ord a) => a -> Tree a -> Tree a  
treeInsert x EmptyTree = singleton x  
treeInsert x (Node a left right)   
    | x == a = Node x left right  
    | x < a  = Node a (treeInsert x left) right  
    | x > a  = Node a left (treeInsert x right)  

-- Checking if an element is present in a BST
treeElem :: (Ord a) => a -> Tree a -> Bool  
treeElem x EmptyTree = False  
treeElem x (Node a left right)  
    | x == a = True  
    | x < a  = treeElem x left  
    | x > a  = treeElem x right  

-- Typeclasses have pretty much nothing to do with classes in languages like Java or Python

-- Functor
class Functor f where  
    fmap :: (a -> b) -> f a -> f b  