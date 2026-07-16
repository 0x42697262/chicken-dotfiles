-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Window Rules Configuration               ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- Windows Rules https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local colors = require("config/colors")

-- Float Necessary Windows
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Picture in picture)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Save File)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { class = "^(LibreWolf)$", title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(CachyOSHello)$" }, float = true })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Steam - Self Updater)$" }, float = true })

-- Increase the opacity
hl.window_rule({ match = { class = "^(thunar|nemo)$" }, opacity = "0.92" })
hl.window_rule({ match = { class = "^(discord|armcord|webcord)$" }, opacity = "0.96" })
hl.window_rule({ match = { title = "^(QQ|Telegram)$" }, opacity = "0.95" })
hl.window_rule({ match = { title = "^(NetEase Cloud Music Gtk4)$" }, opacity = "0.95" })

-- General window rules
hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    size  = { 960, 540 },
    move  = { "monitor_w * 0.25", "0" },
})
hl.window_rule({
    match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$" },
    float = true,
    size  = { 960, 540 },
    move  = { "monitor_w * 0.25", "0" },
})
hl.window_rule({ match = { title = "^(danmufloat)$" }, pin = true })
hl.window_rule({ match = { title = "^(danmufloat|termfloat)$" }, rounding = 5 })
hl.window_rule({ match = { class = "^(kitty|Alacritty)$" }, animation = "slide" })
hl.window_rule({ match = { class = "kitty", title = "nmtui" }, tag = "+kitty-nmtui" })
hl.window_rule({ match = { tag = "kitty-nmtui" }, float = true })
hl.window_rule({ match = { class = "^(org.mozilla.firefox)$" }, no_blur = true })

-- Decorations related to floating windows on workspaces 1 to 10
hl.window_rule({
    match        = { float = true, workspace = "w[tv1-10]" },
    border_size  = 2,
    border_color = colors.cachylblue,
    rounding     = 8,
})

-- Decorations related to tiling windows on workspaces 1 to 10
hl.window_rule({
    match       = { float = false, workspace = "f[1-10]" },
    border_size = 3,
    rounding    = 4,
})

-- Windows Rules End --
-- Workspaces Rules https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ --
-- hl.workspace_rule({ workspace = "1", default = true, monitor = priMon })
-- hl.workspace_rule({ workspace = "6", default = true, monitor = secMon })
-- Workspace selectors https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/#workspace-selectors
-- hl.workspace_rule({ workspace = "r[1-5]", monitor = priMon })
-- hl.workspace_rule({ workspace = "r[6-10]", monitor = secMon })
-- hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = applauncher })
-- Smart gaps https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/#smart-gaps
hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 5, gaps_in = 3 })

-- Workspaces Rules End --
-- Layers Rules --
-- hl.layer_rule({ match = { namespace = "logout_dialog" }, animation = "slide top" })
-- hl.layer_rule({ match = { namespace = "waybar" }, animation = "popin 50%" })
-- hl.layer_rule({ match = { namespace = "waybar" }, animation = "slide down" })
-- hl.layer_rule({ match = { namespace = "wallpaper" }, animation = "fade 50%" })
-- Layers Rules End --

-- Tearing Rules
-- hl.window_rule({ match = { title = "osu!" }, immediate = true })
hl.window_rule({ match = { fullscreen = true }, immediate = true })
