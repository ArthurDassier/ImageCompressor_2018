import Control.Exception
import System.IO
import System.Environment
import System.Exit

main = do
    result <- try (openFile "example.txt" ReadMode) :: IO (Either SomeException Handle)
    case result of
        Left ex  -> exitWith (ExitFailure 84)
        Right val -> putStrLn $ "The answer was: " ++ show val
