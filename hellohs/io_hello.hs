putW = putStrLn "W"
putX = putStrLn "X"

makePutY = return $ putStrLn "Y"
makePutZ = return (putStrLn "Z")
-- $でも()でも変わらないが、$のほうがかっこが減って便利

main = do
    let
        w = putW
        x = putX
    w
    putY <- makePutY
    putZ <- makePutZ
    putZ