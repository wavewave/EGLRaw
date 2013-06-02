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

{#import Graphics.Rendering.EGL.Raw.Types #}

import Foreign
import Foreign.C

#include <EGL/egl.h>

{#fun eglGetError as eglGetError {} -> `Int' #}

{#fun eglGetDisplay as eglGetDisplay {withEGLNativeDisplayType* `EGLNativeDisplayType'} -> `EGLDisplay' mkEGLDisplay* #}  

{#fun eglInitialize as eglInitialize {withEGLDisplay* `EGLDisplay', id `Ptr CInt', id `Ptr CInt'} -> `Bool' #}

{#fun eglTerminate as eglTerminate {withEGLDisplay* `EGLDisplay'} -> `Bool' #}

{#fun eglQueryString as ^ {withEGLDisplay* `EGLDisplay', `Int'} -> `CString' id #}

-- {#fun eglGetConfigs as ^ {id `EGLDisplay', id `EGLConfig', id `EGLint', id `Ptr EGLint'} -> `Bool' getBool #}

-- {#fun eglChooseConfig as ^ {id `EGLDisplay', id `Ptr EGLint', id `Ptr EGLConfig', id `EGLint', id `Ptr EGLint'} -> `Bool' getBool #}


