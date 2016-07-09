module Main where

import Text.Chart

stats :: [Named Int]
stats = [ (109891, "Objective-C")
        , (13537, "Ruby")
        , (268799, "Python")
        , (2597, "HTML")
        , (3196, "CSS")
        , (238320, "Haskell")
        , (19098, "Shell")
        , (2228, "C")
        , (2571, "CoffeeScript")
        , (8782, "JavaScript")
        , (12426, "VimL")
        , (191787, "C++")
        ]

main :: IO ()
main = printChart 100 stats
