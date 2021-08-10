{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tests (
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
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/bin"
libdir     = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/lib/x86_64-osx-ghc-8.10.4/tests-0.0.1-JRb9yUnZ890KQ4TAbLEJlJ"
dynlibdir  = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/share/x86_64-osx-ghc-8.10.4/tests-0.0.1"
libexecdir = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/libexec/x86_64-osx-ghc-8.10.4/tests-0.0.1"
sysconfdir = "/Users/jmvc/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-osx/6e4b695abb2707a7ea93bcb6b4e2cea9ee8b4a84b8bf75fc7520aca8f7716fe5/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
