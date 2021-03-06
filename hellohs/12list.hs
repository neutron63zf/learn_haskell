import Data.Char
import Data.Maybe
import Data.Either

main = eithertest

firstlist = do
    print [1,2,3]
    print ([1,2,3] :: [Double]) -- [1.0,2.0,3.0]
    print [1,2,3.5] -- ok as [Double]
    -- print [1 :: Int, 2, 3.5 ] -- error
    print [1..10]
    -- print ([1,3,..] !! 10000) -- error
    print ([1,3..] !! 10000)
    -- print [1,3..] !! 10000 -- error 左優先。そりゃそうか。
    -- print 1:2:3 -- error
    -- print 1:2:3:[] --error
    print $ 1:2:3:[]
    let
        y = [1,3..9]
        z = [1,3..8]
        w = [1,3..7.5]
        -- v = [1,3::Int..7.5] -- この時点でerror
        u:us = z
        t:tm:te = y
        s = [y,z,w] -- 型さえ合っていれば長さはよい
        -- r = [1,3,4..8] -- error
        -- q = [1.1,2.3,3.5..7.1]
        p = [1.1,2.3..7.1]
    print y
    print z -- not error [1,3,5,7]
    print w -- not error as [Double]
    -- print $ y !! 6 -- index too large
    print u -- 1
    print us -- [3,5,7]
    print t -- 1
    print tm -- 3
    print te -- [5,7,9]
    print s
    print $ head [1,2,3]
    print $ tail z
    -- print r -- error
    -- print q
    print p
    let
        a = map (42 / ) [1..10]
        b = map ( / 3) [1..10]
        c = foldr (-) 0 [1..10]
        d = foldl (-) 0 [1..10]
    print a
    print b
    print [c,d]
    let
        e = map toUpper "abcd1"
        f = ['a','b'..'z']
    print e -- "ABCD1"
    print f -- abcdefghijklmnopqrstuvwz
    let
        g = "a" ++ show [1,3..7] ++ "."
        h = concat ["a",show [1,4..13],"!"]
        i = concat [[1,2,3],[4,5,6],[7,8,9]]
    print g
    print h
    print i

tuple = do
    print "tuple learning"
    let
        x = (True, [1,2,3])
        y = fst x
        z = snd x
        w = (4,5,[6,7])
        v = let (_,_,n) = w in n
    print (y,z,v) -- 最初と比較を続けている

maybetest = do
    let
        percentage k n  | n == 0    = Nothing
                        | otherwise = Just (100.0 * k / n)
    -- Maybe Double
    -- Just Double / Nothing
    print $ percentage 10 5
    print $ percentage 20 0
    let
        x = \a b -> case percentage a b of  Nothing -> "undefined"
                                            Just x -> show x
    print $ x 20 50
    print $ x 20 0
    let
        p = percentage 30 50
        q = percentage 30 0
        mp = \a b -> maybe "maybetest" show $ percentage a b
    print $ if isNothing p then "wow" else show $ fromJust p
    print $ if isNothing q then "wow" else show $ fromJust q
    print $ mp 20 60
    print $ mp 2 0

eithertest = do
    let
        newp a b = case b of    0           -> Left "what"
                                otherwise   -> Right $ 100.0 * a / b
        -- Either String Double
        -- Left String / Right Double
    print $ newp 10 100
    print $ newp 10 0
    print $ case newp 10 0 of   Left err    -> err
                                Right x     -> show x
    print $ case newp 10 100 of Left err    -> err
                                Right x     -> show x
    print $ either id show $ newp 5 30
    print $ either id show $ newp 10 0
    -- print $ either show id $ newp 5 10