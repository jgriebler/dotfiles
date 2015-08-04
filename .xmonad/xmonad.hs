{-# LANGUAGE FlexibleContexts #-}

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.StackSet
import XMonad.Util.EZConfig

main = xmonad =<< xmobar' customConfig

customConfig = defaultConfig
        { modMask    = mod4Mask
        , terminal   = "/usr/bin/gnome-terminal"
        , manageHook = manage'
        , layoutHook = layout'
        } `additionalKeysP` keys'

xmobar' conf = statusBar "xmobar" customPP toggleKey conf
  where
    toggleKey XConfig { modMask = modm } = (modm, xK_b)
    customPP = xmobarPP { ppTitle = xmobarColor "green" "" . shorten 120 }

manage' = composeAll [ manageHook defaultConfig
                     , manageDocks
                     , isFullscreen               --> doFullFloat
                     , className =? "Firefox"     --> doShift "1"
                     , className =? "Thunderbird" --> doShift "1"
                     , className =? "Hexchat"     --> doShift "2"
                     , className =? "dota_linux"  --> doSink
                     ]
  where
    doSink = ask >>= \ w -> doF (sink w)

layout' = smartBorders $ tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall 1 (1/20) (3/5)

keys' = [ ("M-S-<F11>"              , spawn "shutdown -h now")
        , ("<XF86AudioLowerVolume>" , spawn "amixer set Master 5%-")
        , ("<XF86AudioMute>"        , spawn "amixer set Master toggle")
        , ("<XF86AudioRaiseVolume>" , spawn "amixer set Master 5%+")
        , ("<Print>"                , spawn "import -silent -window root screenshot.png")
        , ("S-<Print>"              , spawn "import -silent screenshot.png")
        ]
