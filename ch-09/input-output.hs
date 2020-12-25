import Data.Char  
  
main = do  
    putStrLn "What's your first name?"  
    firstName <- getLine  
    putStrLn "What's your last name?"  
    lastName <- getLine  
    let bigFirstName = map toUpper firstName  
        bigLastName = map toUpper lastName  
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"

-- return in Haskell doesn't end a program but converts a pure value into I/O
-- Don't think of a function like putStrLn as a function that takes a string and 
-- prints it to the screen. Think of it as a function that takes a string and returns an I/O action. 
-- That I/O action will, when performed, print beautiful poetry to your terminal.