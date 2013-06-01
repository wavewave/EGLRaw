{-# LANGUAGE EmptyDataDecls, ForeignFunctionInterface #-}

-----------------------------------------------------------------------------
-- |
-- Module      : Graphics.Rendering.EGL.Raw
-- Copyright   : (c) 2013 Ian-Woo Kim
--
-- License     : BSD3
-- Maintainer  : Ian-Woo Kim <ianwookim@gmail.com>
-- Stability   : experimental
-- Portability : GHC
--
-----------------------------------------------------------------------------

module Graphics.Rendering.EGL.Raw where

import Foreign.Ptr 
import Foreign.C.Types 
import Foreign.C.String

#include <EGL/egl.h>

-- | conversion from CInt to Bool 
--   strangely, n often becomes -256 for False
getBool :: CUInt -> Bool --  CInt -> Bool 
getBool n | n == 1 = True 
          | otherwise = False 

setBool :: Bool -> CUInt -- CInt 
setBool True = 1
setBool False = 0

type EGLint = CInt

data OpaqueEGLNativeDisplayType 
{#pointer EGLNativeDisplayType as EGLNativeDisplayType -> OpaqueEGLNativeDisplayType #}

-- type EGLBooleaan = CUInt 

data OpaqueEGLConfig
{#pointer EGLConfig as EGLConfig -> OpaqueEGLConfig #}
-- {#pointer *EGLConfig as EGLConfigRef -> OpaqueEGLConfig #} 

data OpaqueEGLContext 
{#pointer EGLContext as EGLContext -> OpaqueEGLContext #}

data OpaqueEGLDisplay 
{#pointer EGLDisplay as EGLDisplay -> OpaqueEGLDisplay #}

data OpaqueEGLSurface
{#pointer EGLSurface as EGLSurface -> OpaqueEGLSurface #}

data OpaqueEGLClientBuffer 
{#pointer EGLClientBuffer as EGLClientBuffer -> OpaqueEGLClientBuffer #}


{#fun eglGetError as ^ {} -> `EGLint' id #}

{#fun eglGetDisplay as ^ {id `EGLNativeDisplayType'} -> `EGLDisplay' id #}

{#fun eglInitialize as ^ {id `EGLDisplay', id `Ptr EGLint', id `Ptr EGLint'} -> `Bool' getBool #}

{#fun eglTerminate as ^ {id `EGLDisplay'} -> `Bool' getBool #}

{#fun eglQueryString as ^ {id `EGLDisplay', id `EGLint'} -> `CString' id #}

-- {#fun eglGetConfigs as ^ {id `EGLDisplay', id `EGLConfig', id `EGLint', id `Ptr EGLint'} -> `Bool' getBool #}

-- {#fun eglChooseConfig as ^ {id `EGLDisplay', id `Ptr EGLint', id `Ptr EGLConfig', id `EGLint', id `Ptr EGLint'} -> `Bool' getBool #}

