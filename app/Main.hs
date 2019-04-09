import System.Environment
import System.Exit
import Data.Char
import Data.List
import Debug.Trace
import Text.Read
--
-- type Color = (Double, Double, Double)
-- type Point = (Int, Int)
-- type Nomadefinir = (Point, Color)


-- distance :: Color -> Color -> Double
-- distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))
--
-- fileToArray :: [String] -> [nomADefinir] -> Int -> [nomADefinir]
-- fileToArray line array 0 = array
-- fileToArray line array idx =
--
-- findMin :: Color -> [String] -> Int -> Color -> Color
-- findMin (ux, uy, uz) line idx mini | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
--                          | idx == length (line) - 1 = mini
--                          | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
--                          | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
-- --

handleArg :: [String] -> IO()
handleArg [n, e, file] = do print "a"

main = do
    print("a")
    -- args <- getArgs
    -- content <- readFile (args !! 0)
    -- let linesOfFiles = lines content
    -- print linesOfFiles

-- main = getArgs >>= handleArg

-- main = do
