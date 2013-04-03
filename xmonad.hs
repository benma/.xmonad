import XMonad
-- import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Config.Xfce

myManageHook = composeAll
               [ -- resource =? "xfce4-notifyd" --> doIgnore <+> doF W.focusDown -- prevent notifications from stealing focus
                 className =? "Xfce4-notifyd" --> doIgnore <+> doF W.focusDown -- prevent notifications from stealing focus
               ]

myWorkspaces = map show [1..9::Int]
myModMask = mod4Mask -- super

myKeys = [
 
    -- other additional keys
  
         ] ++ 
         [((m .|. myModMask, k), windows $ f i)
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = xmonad $ xfceConfig
   { XMonad.terminal = "gnome-terminal"
   , manageHook = myManageHook <+> manageHook xfceConfig
   , modMask = myModMask
   , workspaces = myWorkspaces
   } `additionalKeys` myKeys

