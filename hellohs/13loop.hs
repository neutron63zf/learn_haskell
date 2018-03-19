import Control.Monad (when)

main = fizzbuzz2

-- alias for print
p = print

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