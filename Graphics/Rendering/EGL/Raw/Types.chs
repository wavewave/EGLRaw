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

import Control.Monad (liftM)
import Foreign 
import Foreign.C
import Foreign.Ptr 

-- | very unsafe but no workaround found yet
{#pointer *EGLNativeDisplayType as EGLNativeDisplayType foreign newtype #}
withEGLNativeDisplayType (EGLNativeDisplayType x) act = do 
  nx <- (newForeignPtr_ . castPtr . unsafeForeignPtrToPtr) x
  withForeignPtr nx act 

mkEGLNativeDisplayType :: Ptr EGLNativeDisplayType -> IO EGLNativeDisplayType
mkEGLNativeDisplayType dpytypePtr = do
  dpytypeForeignPtr <- newForeignPtr_ dpytypePtr
  return (EGLNativeDisplayType dpytypeForeignPtr)


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

{-# INLINE cIntConv #-}
cIntConv :: (Integral a, Integral b) => a -> b
cIntConv  = fromIntegral

{-# INLINE cFloatConv #-}
cFloatConv :: (RealFloat a, RealFloat b) => a -> b
cFloatConv  = realToFrac

{-# INLINE cFromBool #-}
cFromBool :: Num a => Bool -> a
cFromBool  = fromBool

{-# INLINE cToBool #-}
cToBool :: (Eq a, Num a) => a -> Bool
cToBool  = toBool

{-# INLINE cToEnum #-}
cToEnum :: (Integral i, Enum e) => i -> e
cToEnum  = toEnum . cIntConv

{-# INLINE cFromEnum #-}
cFromEnum :: (Enum e, Integral i) => e -> i
cFromEnum  = cIntConv . fromEnum

{-# INLINE peekFloatConv #-}
peekFloatConv :: (Storable a, RealFloat a, RealFloat b) =>  Ptr a -> IO b
peekFloatConv  = liftM cFloatConv . peek

{-# INLINE withFloatConv #-}
withFloatConv :: (Storable b, RealFloat a, RealFloat b) => a -> (Ptr b -> IO c) -> IO c
withFloatConv  = with . cFloatConv

{-# INLINE withArrayFloatConv #-}
withArrayFloatConv :: (Storable b, RealFloat a, RealFloat b) => [a] -> (Ptr b -> IO b1) -> IO b1
withArrayFloatConv = withArray . map (cFloatConv)
