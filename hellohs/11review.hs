scope = do
    print (x + y + z)
    where
        x = 10
        y = 20
        z = x + y * 2
    -- ここまでだと、The last statement in a 'do' block must be an expressionとなる
    -- print (x + y + z)
    -- これをやると、上のprintを消さないといけない

x = 15

cast = do
    putStrLn "Hello, World!"
    putStrLn "from first hs file"
    print x
    let
        x = 20
    print x

main = cast