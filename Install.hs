import Data.List
import Control.Monad
import System.Directory
import System.Environment
import System.Exit
import System.FilePath
import System.Posix.Files

main :: IO ()
main = do
    args <- getArgs
    when (null args) $ do
      putStrLn "error: requires username"
      exitFailure
    let name = head args
        prefix = "/home" </> name
    e <- doesDirectoryExist prefix
    unless e $ do
      putStrLn "error: user home directory doesn't exist"
      exitFailure
    cur <- getCurrentDirectory
    fs <- (\\ ignore) <$> listDirectory "."
    mapM_ (process prefix cur "") fs
  where
    ignore = [".git", ".gitignore", "Install.hs"]
    process prefix base dir f = do
      d <- doesDirectoryExist $ dir </> f
      if d
        then do
          let dir' = dir </> f
          e <- doesDirectoryExist $ prefix </> dir'
          unless e $ createDirectory $ prefix </> dir'
          fs <- listDirectory dir'
          mapM_ (process prefix base dir') fs
        else createSymbolicLink (base </> dir </> f) (prefix </> dir </> f)
    listDirectory d = (\\ [".", ".."]) <$> getDirectoryContents d
