module Point exposing
    ( Point
    , fromRecord
    , getX
    , getY
    , setX
    , setY
    , moveX
    , moveY
    , sqDistance
    )

{-| 2次元座標上の点に関するモジュール


# クラス

@docs Point


# コンストラクター

@docs fromRecord


# ゲッター

@docs getX
@docs getY


# セッター

@docs setX
@docs setY


# インスタンスメソッド

@docs moveX
@docs moveY


# クラスメソッド

@docs sqDistance

-}


{-| 2次元座標上の点に関するクラス
-}
type Point
    = Point
        { x : Int
        , y : Int
        }


{-| x, y座標から `Point` インスタンスを作成する

    import Point exposing (Point)

    p : Point
    p =
        Point.fromRecord { x = 1, y = 2 }

-}
fromRecord : { x : Int, y : Int } -> Point
fromRecord =
    Point


{-| x座標を取得する

    p : Point
    p = Point.fromRecord { x = 1, y = 2 }

    -- いわゆる関数っぽい記法
    getX(p)
    --> 1

    -- 本来のElmの関数適用
    getX p
    --> 1

    -- パイプを使って、よりゲッターっぽくつかう方法
    p |> getX
    --> 1

-}
getX : Point -> Int
getX (Point point) =
    point.x


{-| y座標を取得する

    Point.fromRecord { x = 1, y = 2 }
        |> getY
    --> 2

-}
getY : Point -> Int
getY (Point point) =
    point.y


{-| x座標を置き換える

    p : Point
    p = Point.fromRecord { x = 1, y = 2 }

    p2 : Point
    p2 = p |> setX 3
    -- `setX 3 p` と同等

    p2 |> getX
    --> 3

    p |> getX
    --> 1

-}
setX : Int -> Point -> Point
setX new (Point point) =
    Point
        { point | x = new }


{-| y座標を置き換える

    Point.fromRecord { x = 1, y = 2 }
        |> setY 3
        |> getY
    --> 3

-}
setY : Int -> Point -> Point
setY new (Point point) =
    Point
        { point | y = new }


{-| x軸方向に移動する

    original : Point
    original = Point.fromRecord { x = 1, y = 0 }

    moved : Point
    moved = original |> moveX 4

    moved |> getX
    --> 5

-}
moveX : Int -> Point -> Point
moveX diff (Point point) =
    Point
        { point | x = point.x + diff }


{-| y軸方向に移動する

    Point.fromRecord { x = 1, y = 2 }
        |> moveY 4
        |> getY
    --> 6

-}
moveY : Int -> Point -> Point
moveY diff (Point point) =
    Point
        { point | y = point.y + diff }


{-| 2点間のユークリッド距離の2乗を計算する

    p1 : Point
    p1 = Point.fromRecord { x = 1, y = 2 }

    p2 : Point
    p2 = Point.fromRecord { x = 4, y = 6 }

    Point.sqDistance p1 p2
    --> 25

-}
sqDistance : Point -> Point -> Int
sqDistance (Point point1) (Point point2) =
    (point2.x - point1.x) ^ 2 + (point2.y - point1.y) ^ 2
