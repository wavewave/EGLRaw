module Main where

import System.Console.CmdArgs

import Graphics.Rendering.EGL.Raw.ProgType
import Graphics.Rendering.EGL.Raw.Command

main :: IO () 
main = do 
  putStrLn "EGL"
  param <- cmdArgs mode

  commandLineProcess param