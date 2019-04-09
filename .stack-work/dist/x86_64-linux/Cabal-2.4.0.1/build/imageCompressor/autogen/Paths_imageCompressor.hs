{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_imageCompressor (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/bin"
libdir     = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/lib/x86_64-linux-ghc-8.6.4/imageCompressor-0.1.0.0-uuL4oW9eipBL98OEqm1gG-imageCompressor"
dynlibdir  = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/lib/x86_64-linux-ghc-8.6.4"
datadir    = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/share/x86_64-linux-ghc-8.6.4/imageCompressor-0.1.0.0"
libexecdir = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/libexec/x86_64-linux-ghc-8.6.4/imageCompressor-0.1.0.0"
sysconfdir = "/home/adassier/Delivery/Semestre_4/Fonctional_Programming/FUN_imageCompressor_2018/.stack-work/install/x86_64-linux/lts-13.16/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "imageCompressor_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "imageCompressor_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "imageCompressor_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "imageCompressor_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "imageCompressor_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "imageCompressor_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
