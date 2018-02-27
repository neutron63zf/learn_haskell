main :: IO () -- 明示的に指定しているだけ?
main = do
    putStrLn "Hello, World!"
    putStrLn "from first hs file"
    let
        x = 20
    print x