-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Autostart Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local defaults = require("config/defaults")

-- Autostart wiki https://wiki.hypr.land/Configuring/Basics/Autostart/
-- hl.exec_cmd() spawns asynchronously, no need for `& disown`.
hl.on("hyprland.start", function()
    -- hl.exec_cmd([[swaybg -o '*' -i /usr/share/wallpapers/cachyos-wallpapers/Skyscraper.png -m fill]])
    -- hl.exec_cmd([[swaybg --mode fill -o '*' -i ~/.config/hypr/assets/wallpaper/koishi_and_co.jpg]])
    hl.exec_cmd([[swaybg -o '*' -i ~/.config/hypr/assets/wallpaper/hatsune_miku.png]])
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("nixGLIntel caelestia shell -d")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd([[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown"]])
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("sunshine")

    -- ## Slow app launch fix
    hl.exec_cmd("systemctl --user import-environment")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null")
    hl.exec_cmd("dbus-update-activation-environment --systemd")

    -- ## Idle configuration
    hl.exec_cmd(defaults.idlehandler)
end)
