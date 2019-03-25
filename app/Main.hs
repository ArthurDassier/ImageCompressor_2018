import System.Environment
import System.Exit
import Data.Char
import Data.List
import Debug.Trace
import Text.Read
import Generate
import Check
import Unique
import Utils


fClean :: [String] -> String -> Int -> IO()
fClean array alpha n = do
        handleArg alpha 0 n
        a <- getLine
        if ((length a) == 0) then usage
            else
            if (a /= "END")
                        then if check a [] n alpha (length(a)) == True && uniqueAll a array (length a) 0 == False
                    then fClean (a:array) alpha n
                    else fClean array alpha n
            else printArray (reverse array) 0

checkArg :: String -> Bool
checkArg "--check" = True
checkArg "--unique" = True
checkArg "--clean" = True
checkArg _ = False


startUnique :: Int -> String -> IO()
startUnique n alpha = do
        handleArg alpha 0 n
        a <- getLine
        b <- getLine
        if (length a) == 0 || (length b) == 0  then usage
        else
            if (unique a b (length a) n alpha == True) then putStrLn "KO"
                else putStrLn "OK"

startCheck :: Int -> String -> IO()
startCheck n alpha = do
    handleArg alpha 0 n
    a <- getLine
    if (length a) == 0 then usage
        else if (check a [] n alpha (length a) == True) then putStrLn "OK"
            else putStrLn "KO"

startGenerate  :: String -> Int  -> IO()
startGenerate alpha n = do
     handleArg alpha 0 n
     generate (generateStart alpha "" n) n (reverse alpha) 0



doArg :: [String] -> IO ()
doArg [nbr, alpha, "--clean"] = print "--clean"
doArg [] = print "vide"
doArg args = print args


main = getArgs >>= doArg







--
-- main = do
--           args <- getArgs
--           if (length args == 1) then do
--               if ((readMaybe (concat [args !! 0]) :: Maybe Int) == Nothing)
--                   then usage
--                         else do
--                             let n = read (concat [args !! 0]) :: Int
--                             startGenerate "01" n
--           else if (length args == 2) then do
--                         if ((readMaybe (concat [args !! 0]) :: Maybe Int) == Nothing)
--                             then usage
--                         else do
--                               let n = read (concat [args !! 0]) :: Int
--                               if (checkArg (concat [args !! 1]) == False) then do
--                                       startGenerate (concat [args !! 1]) n
--                               else if (concat [args !! 1] == "--clean") then
--                                       fClean [] "01" 3
--                               else if (concat [args !! 1] == "--unique") then
--                                       startUnique n "01"
--                               else if (concat [args !! 1] == "--check") then do
--                                     startCheck n "01"
--                               else
--                                      usage
--                               else if (length args == 3) then do
--                                         if ((readMaybe (concat [args !! 0]) :: Maybe Int) == Nothing)
--                                             then usage
--                                         else do
--                                               let n = read (concat [args !! 0]) :: Int
--                                               if (concat [args !! 2] == "--check") then
--                                                       startCheck n (concat [args !! 1])
--                                               else if (concat [args !! 2] == "--clean") then
--                                                      fClean [] (concat [args !! 1]) n
--                                               else if (concat [args !! 2] == "--unique") then
--                                                     startUnique n (concat [args !! 1])
--                                               else
--                                                     usage
--                   else do
--                           usage
