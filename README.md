This repository includes my notes for the free online e-book, Learn You a Haskell for Great Good, written by Miran Lipovača. The book written in the form of a tutorial is available on this [link](http://learnyouahaskell.com/chapters)

The Haskell code and problems from the book can be tried on an Online [REPL](https://tryhaskell.org/) or a local Haskell installation (stack recommended).

Online iHaskell notebook is available at [Binder](https://mybinder.org/v2/gh/gibiansky/IHaskell/master) but it can crash sometimes while building.

## Useful commands

#### Haskell Interpreter

You can start an interpreter using the command `stack ghci` 

To load a Haskell script into the interpreter, use `:load` or `:l`, for eg. `:l <script-name.hs>`

To check the type of an expression, use `:type` or `:t`, for eg., `:t "Pritesh"` should return `[Char]`

To load a module in the interpreter, use `:m + Data.List`, say, for importing the module `Data.List`, or 
use `:m + Data.List Data.Map Data.Set` to import more than 1 modules via the interpreter.

#### Running a script on the command line

Option 1 : 
To compile a Haskell program, run `stack ghc <name-of-program.hs>` in the folder where the program is present.
To run the compiled program, now run `./<name-of-program.hs>`.

Option 2: 
To run a Haskell program on the fly, instead of compiling first, use `stack runhaskell helloworld.hs`

