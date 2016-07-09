module Text.Chart
    ( Named
    , showChart
    , showChart'
    , printChart
    , printChart'
    ) where

import Data.List (sort)

type Named a = (a, String)

fractions = ['▏', '▎', '▍', '▋', '▊', '▉']

showBar :: Bool -> Int -> Int -> Int -> Named Int -> String
showBar displayValue maxBarLength maxKeyNameLength maxValue (value, name) =
  let wholeNumberPart = fromIntegral $ (value * maxBarLength) `div` maxValue
      fractionalPart = fromIntegral $ (value * maxBarLength) `mod` maxValue
   in concat [ name
             , replicate (maxKeyNameLength - length name + 1) ' '
             , replicate wholeNumberPart (last fractions)
             , [fractions !! (length fractions * fractionalPart `div` maxValue)]
             , if displayValue then ' ' : show value else ""
             ]

showChart :: Int -> [Named Int] -> String
showChart = showChart' True

showChart' :: Bool -> Int -> [Named Int] -> String
showChart' _ _ [] = ""
showChart' displayValue maxBarLength ns =
  let maxKeyNameLength = maximum . map (length . snd) $ ns
      maxValue = maximum . map fst $ ns
   in unlines . map (showBar displayValue maxBarLength maxKeyNameLength maxValue) . reverse . sort $ ns

printChart :: Int -> [Named Int] -> IO ()
printChart = printChart' True

printChart' :: Bool -> Int -> [Named Int] -> IO ()
printChart' displayValue maxBarLength ns = putStrLn $ showChart' displayValue maxBarLength ns

