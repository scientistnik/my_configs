import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Config.Xfce

myLayout = Full ||| tiled ||| Mirror tiled
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = spacing 5 $ Tall nmaster delta ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 2/3
 
    -- Percent of screen to increment by when resizing panes
    delta   = 5/100

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , resource	=? "chromium"	    --> doIgnore ]

main = xmonad =<< xmobar xfceConfig
	{ terminal = "xterm"
	, modMask = mod4Mask
	, borderWidth = 1
	, layoutHook = myLayout
	, workspaces = ["web","shell","3","sound","5"]
	, normalBorderColor = "#9E4646"
	, focusedBorderColor = "#285231"
	}
