import System.Environment
import System.Exit
import System.IO
import Data.Char
import Data.List
import Debug.Trace
import Text.Read
import Data.List

type Color = (Double, Double, Double)
type Point = (Int, Int)
type Nomadefinir = (Point, Color)


distance :: Color -> Color -> Double
distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))

findMin :: Color -> [String] -> Int -> Color -> Color
findMin (ux, uy, uz) line idx mini | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
                         | idx == length (line) - 1 = mini
                         | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
                         | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)


replaceStringSecond :: [String] -> Int -> [String] -> [String]
replaceStringSecond array index result
    | (length array) == index = result
    | otherwise = replaceStringSecond array (index + 1) (result ++ [((init (array !! index)) ++ [']'])])

replaceStringFirst :: [String] -> Int -> [String] -> [String]
replaceStringFirst array index result
    | (length array) == index = replaceStringSecond result 0 []
    | otherwise = replaceStringFirst array (index + 1) (result ++ [(['['] ++ (tail (array !! index)))])

split :: String -> Int -> String -> [String] -> [String]
split [] _ _ _ = []
split file index str list
    | (length file) == index = list
    | (file !! index) /= '\n' = split file (index + 1) (str ++ [(file !! index)]) list
    | otherwise = split file (index + 1) [] (list ++ [str])

replaceChar :: Char -> Char -> Char -> Char
replaceChar c toReplace new
    | c == toReplace = new
    | otherwise = c

replaceString :: String -> String -> Char -> Char -> Int -> String
replaceString array result c1 c2 index
    | 0 == index = result
    | otherwise = replaceString (tail array) (result ++ [(replaceChar (head array) c1 c2)]) c1 c2 (index - 1)

replaceArray :: [String] -> [String] -> Char -> Char -> Int -> [String]
replaceArray array result c1 c2 index
    | (length array) == 0 = result
    | otherwise = replaceArray (tail array) (result ++ [(replaceString (head array) [] c1 c2 (length (head array)))]) c1 c2 (index + 1)

stringToInt :: [String] -> Int -> [[Int]] -> [[Int]]
stringToInt array idx result
    | length (array) == idx = result
    | otherwise = stringToInt array (idx + 1) (read (array !! idx):result)

main = do
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    print (stringToInt (replaceArray (replaceArray (replaceArray (replaceStringFirst (split contents 0 [] []) 0 []) [] ' ' ',' 0) [] ')' ' ' 0) [] '(' ' ' 0) 0 [])
