import System.Environment
import System.Exit
import System.IO
import Data.Char
import Data.List
import Debug.Trace
import Text.Read
import Data.List

-- type Point (Double, Double)
-- type Color (Double, Double, Double)

-- data Image = Image Int, Int, Int, Int, Int deriving (show)
-- square :: Int -> Int -> Double
-- square a b = ((a - b) ^ 2)

isParenthesis :: Char -> Bool
isParenthesis c
    | c == '(' || ord c == ')' = True
    | otherwise = False

    -- replaceO = map (\c -> if c=='O' then 'X'; else c)

split :: String -> Int -> String -> [String] -> [String]
split [] _ _ _ = []
split _ 180 _ _ = []
split file index str list
    | (length file - 1) == index = list
    | (file !! index) /= '\n' = split file (index + 1) (str ++ [(file !! index)]) list
    | otherwise = split file (index + 1) [] (list ++ [str])

main = do  
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    print (split contents 0 [] [])