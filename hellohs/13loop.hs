import Control.Monad (when,forM_)

main = fbz4

-- alias for print
p = print

fbz4 = do
    forM_ [1..20] $ \i -> do
        putStrLn $ fizzbuzz i
        where
            fizzbuzz n
                | n `mod` 15    == 0    = "FizzBuzz"
                | n `mod` 3     == 0    = "Fizz"
                | n `mod` 5     == 0    = "Buzz"
                | otherwise             = show n            

fbz3 = foldr f (return ()) $ map fizzbuzz [1..20]
    where
        fizzbuzz n
            | n `mod` 15    == 0    = "FizzBuzz"
            | n `mod` 3     == 0    = "Fizz"
            | n `mod` 5     == 0    = "Buzz"
            | otherwise             = show n
        f str act = do
            putStrLn str
            act

fizzbuzz2 = loop 0
    where
        loop n
            | n <= 20    = do
                when (n `mod` 3 /= 0 && n `mod` 5 /= 0 ) (putStr $ show n)
                when (n `mod` 3 == 0) (putStr "Fizz")
                when (n `mod` 5 == 0) (putStr "Buzz")
                putStrLn ""
                loop (n + 1)
            | otherwise = return ()

fizzbuzz = loop 0
    where
        loop n | n <= 20    = do
            let
                a = case n of n | n `mod` 3 == 0 && n `mod` 5 == 0 -> putStr "FizzBuzz"
                                | n `mod` 3 == 0    -> putStr "Fizz"
                                | n `mod` 5 == 0    -> putStr "Buzz"
                                | otherwise         -> putStr $ show n
            a
            putStrLn ""
            loop $ n + 1
                | otherwise = return ()

loops = do
    let
        fact n  | n <= 1    = n
                | otherwise = n * fact (n -1)
    p $ fact 10