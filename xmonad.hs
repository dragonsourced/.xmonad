import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.Spacing
import XMonad.Layout.StackTile

gaps(l) =
    spacingRaw False gap True gap True l
    where
        g   = 10
        gap = (Border g g g g)

doRecompile = (recompile True >> spawn "notify-send 'XMonad recompiled'")

term = "st"

main = xmonad $ def {
        layoutHook  = (gaps (Tall 1 0.05 0.5) ||| gaps (StackTile 1 (3/100) (1/2)) ||| Full),
        terminal    = term,
        modMask     = mod4Mask,
        borderWidth = 0
    }
    `additionalKeysP` [
        ("M-S-r", doRecompile),
        ("M-s", spawn "run_script"),
        ("M-p", spawn "menu_run"),
        ("M-<Left>",  spawn "layout prev"),
        ("M-<Right>", spawn "layout next"),
        ("<XF86AudioRaiseVolume>", spawn "chvol 5%+"),
        ("<XF86AudioLowerVolume>", spawn "chvol 5%-"),
        ("<XF86AudioMuteVolume>",  spawn "chvol toggle")
    ]
