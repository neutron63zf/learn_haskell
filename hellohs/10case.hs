-- 今回からスイッチを多用する
casetest = do
    let
        z = w + 2
        y = case x of
            1   -> "1st"
            2   -> "2nd"
            3   -> "3rd"
            x'  -> show x' ++ "th"
        x = 3
        w = 1
        -- z = 4
        -- これを書いた場合は、なんと z = w + 2のほうがアウトになる
    print y
    print z

wildcard = do
    let 
        myDiv x = case x of
            (0, 0) -> 1 :: Int -- このIntがないとエラーになる
            (_, 0) -> maxBound
            (n, m) -> n `div` m
        x = myDiv (100,10)
        y = myDiv (100, 0)
        z = myDiv (0,   0)
    print x
    print y
    print z

aspad = do
    let 
        -- myDivつづき
        myDiv x = case x of
            (0, 0) -> 1 :: Int -- このIntがないとエラーになる
            (_, 0) -> maxBound
            (n, m) -> n `div` m
        divOnMyDiv x = 
            case x of
                (z'@(_, 0), True) -> myDiv z'
                (   (n, m), _   ) -> n`div`m
        x = divOnMyDiv ((5,2), False)
        y = divOnMyDiv ((0,0), False)
        z = divOnMyDiv ((0,0), True)
    print x
    -- print y
    -- これは例外を投げる
    print z

irrefutable = do
    let 
        h x =
            case x of
                 -- ~(y, _) -> 1
                 (x, 1) -> x
                 ~(_,0) -> 0
        x = h (10,1)
        y = h (10,0)
        z = h (0`div`0,0)
        w = h (0`div`0,1)
    print x
    print y
    print z
    print w

constr = do
    let
        x = (1, "one")
        x_ =
            case x of
                (x1, x2) -> print x2
        y = (1, 10)
        y_ = 
            case y of
                (y1, y2) -> print (y1 + y2)
    x_
    y_

main = do
    constr