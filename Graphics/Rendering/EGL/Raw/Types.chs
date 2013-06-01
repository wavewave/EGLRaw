-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.EGL.Raw.Types
-- Copyright   :  2013 Ian-Woo KIm
-- License     :  BSD3
--
-- Maintainer  :  Ian-Woo Kim
-- Stability   :  experimental
-- Portability :  portable
--
-- Haskell bindings to the cairo-gl types.
-----------------------------------------------------------------------------

module Graphics.Rendering.EGL.Raw.Types where

import Foreign 
import Foreign.C

{#pointer *EGLNativeDisplayType as EGLNativeDisplayType foreign newtype #}
withEGLNativeDisplayType (EGLNativeDisplayType x) = withForeignPtr x 

{#pointer EGLConfig as EGLConfig foreign newtype #}
withEGLConfig (EGLConfig x) = withForeignPtr x 

mkEGLConfig :: Ptr EGLConfig -> IO EGLConfig
mkEGLConfig cfgPtr = do
  cfgForeignPtr <- newForeignPtr_ cfgPtr
  return (EGLConfig cfgForeignPtr)

{#pointer EGLContext as EGLContext foreign newtype #}
withEGLContext (EGLContext x) = withForeignPtr x 

mkEGLContext :: Ptr EGLContext -> IO EGLContext
mkEGLContext ctxtPtr = do
  ctxtForeignPtr <- newForeignPtr_ ctxtPtr
  return (EGLContext ctxtForeignPtr)


{#pointer EGLDisplay as EGLDisplay foreign newtype #}
withEGLDisplay (EGLDisplay x) = withForeignPtr x 

mkEGLDisplay :: Ptr EGLDisplay -> IO EGLDisplay
mkEGLDisplay dpyPtr = do
  dpyForeignPtr <- newForeignPtr_ dpyPtr
  return (EGLDisplay dpyForeignPtr)


{#pointer EGLSurface as EGLSurface foreign newtype #}
withEGLSurface (EGLSurface x) = withForeignPtr x 

mkEGLSurface :: Ptr EGLSurface -> IO EGLSurface
mkEGLSurface sfcPtr = do
  sfcForeignPtr <- newForeignPtr_ sfcPtr
  return (EGLSurface sfcForeignPtr)

