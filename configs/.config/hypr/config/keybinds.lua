-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local d = require("config/defaults")

local LMB  = "mouse:272"
local RMB  = "mouse:273"
local KP_1 = "code:87"

-- https://wiki.hypr.land/Configuring/Basics/Binds/
hl.bind("SUPER + RETURN",   hl.dsp.exec_cmd(d.terminal))
hl.bind("SUPER + E",        hl.dsp.exec_cmd(d.filemanager))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(d.capturing))
hl.bind("PRINT",            hl.dsp.exec_cmd(d.screenshot))
hl.bind("SUPER + ALT + F4", hl.dsp.exec_cmd([[loginctl terminate-user ""]]))
hl.bind("ALT + SPACE",      hl.dsp.exec_cmd(d.applauncher))
hl.bind("SUPER + HOME",     hl.dsp.exec_cmd("systemctl suspend"))


-- ======= Windows =======

hl.bind("SUPER + CTRL + F",  hl.dsp.window.fullscreen({ mode = "maximized" }))                 -- monocle
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))     -- fake fullscreen
hl.bind("SUPER + F",         hl.dsp.window.fullscreen())
hl.bind("SUPER + W",         hl.dsp.window.close())
hl.bind("SUPER + ALT + W",   hl.dsp.window.kill())
hl.bind("ALT_R + F",         hl.dsp.window.float())
hl.bind("ALT_R + C",         hl.dsp.window.center())
hl.bind("ALT_R + S",         hl.dsp.layout("togglesplit"))                                     -- dwindle, needs preserve_split
hl.bind("ALT_R + Y",         hl.dsp.window.pin())
hl.bind("SUPER + " .. RMB,   hl.dsp.window.resize(), { mouse = true })                         -- Resize the window towards a direction
hl.bind("SUPER + " .. LMB,   hl.dsp.window.drag(),   { mouse = true })                         -- Drag window


-- ======= Grouping Windows =======

hl.bind("SUPER + CTRL + Z",         hl.dsp.group.toggle())
hl.bind("SUPER + CTRL + SHIFT + Z", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER + CTRL + SHIFT + A", hl.dsp.group.prev(), { repeating = true })
hl.bind("SUPER + CTRL + SHIFT + S", hl.dsp.group.next(), { repeating = true })


-- ======= Apps =======

hl.bind("SUPER + L",             hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"))
hl.bind("SUPER + ALT + " .. KP_1, hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))


-- ======= Toggle Gaps =======

hl.bind("SUPER + SHIFT + G", function()
    hl.config({ general = { gaps_out = 5, gaps_in = 3 } })
end, { description = "Set CachyOS default gaps" })
hl.bind("SUPER + G", function()
    hl.config({ general = { gaps_out = 0, gaps_in = 0 } })
end, { description = "Remove gaps between window" })


-- ======= Volume Control =======

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { repeating = true, locked = true }) -- Raise Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { repeating = true, locked = true }) -- Lower Volume
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd([[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { repeating = true, locked = true }) -- Mutes player audio


-- ======= Playback Control =======

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggles play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { description = "Previous track" })


-- ======= Screen Brightness =======

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true, locked = true }) -- Increases brightness 5%
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true }) -- Decreases brightness 5%


-- ======= Window Actions =======

-- Move window towards a direction
hl.bind("SHIFT + ALT_R + " .. d.left,  hl.dsp.window.move({ direction = "l" }))
hl.bind("SHIFT + ALT_R + " .. d.right, hl.dsp.window.move({ direction = "r" }))
hl.bind("SHIFT + ALT_R + " .. d.up,    hl.dsp.window.move({ direction = "u" }))
hl.bind("SHIFT + ALT_R + " .. d.down,  hl.dsp.window.move({ direction = "d" }))
-- Move focus with MOD + arrow keys
hl.bind("ALT_R + " .. d.left,  hl.dsp.focus({ direction = "l" }))
hl.bind("ALT_R + " .. d.right, hl.dsp.focus({ direction = "r" }))
hl.bind("ALT_R + " .. d.up,    hl.dsp.focus({ direction = "u" }))
hl.bind("ALT_R + " .. d.down,  hl.dsp.focus({ direction = "d" }))
-- Quick resize window with keyboard
hl.bind("CTRL + SHIFT + ALT_R + " .. d.right, hl.dsp.window.resize({ x = 15,  y = 0,   relative = true }), { repeating = true })
hl.bind("CTRL + SHIFT + ALT_R + " .. d.left,  hl.dsp.window.resize({ x = -15, y = 0,   relative = true }), { repeating = true })
hl.bind("CTRL + SHIFT + ALT_R + " .. d.up,    hl.dsp.window.resize({ x = 0,   y = -15, relative = true }), { repeating = true })
hl.bind("CTRL + SHIFT + ALT_R + " .. d.down,  hl.dsp.window.resize({ x = 0,   y = 15,  relative = true }), { repeating = true })
-- Cycle
hl.bind("ALT_R + ESCAPE",      hl.dsp.window.cycle_next({ next = true }),               { repeating = true })
hl.bind("ALT_R + TAB",         hl.dsp.window.cycle_next({ next = true, tiled = true }), { repeating = true })
hl.bind("SHIFT + ALT_R + TAB", hl.dsp.window.cycle_next({ next = false }),              { repeating = true })

-- Move active window to a workspace with SUPER + CTRL + [0-9]
hl.bind("SUPER + CTRL + Tab",         hl.dsp.window.move({ workspace = "+1" }))
hl.bind("SUPER + CTRL + SHIFT + Tab", hl.dsp.window.move({ workspace = "-1" }))
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + CTRL + " .. key,  hl.dsp.window.move({ workspace = i }))
    -- Same as above, but doesn't switch to the workspace
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
-- Window actions End --

-- ======= Workspace Actions =======

-- Switch workspaces with MOD + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
end
-- Scroll through existing workspaces with MOD + TAB
hl.bind("SUPER + TAB",         hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { repeating = true })
hl.bind("SUPER + ALT + TAB",   hl.dsp.focus({ workspace = "previous" }))
-- With SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- Special workspaces (scratchpads)
hl.bind("SUPER + equal",              hl.dsp.workspace.toggle_special("notes"))
hl.bind("SUPER + F1",                 hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind("SUPER + SHIFT + equal",      hl.dsp.window.move({ workspace = "special:notes" }))
hl.bind("SUPER + ALT + SHIFT + F1",   hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
-- Monitor
hl.bind("SUPER_L + M + SLASH",  hl.dsp.workspace.swap_monitors({ monitor1 = d.internal, monitor2 = d.external }))
hl.bind("SUPER_L + M + COMMA",  hl.dsp.focus({ monitor = d.external }))
hl.bind("SUPER_L + M + PERIOD", hl.dsp.focus({ monitor = d.internal }))

-- ======= Additional Settings =======

-- https://wiki.hypr.land/Configuring/Basics/Variables/#binds
hl.config({
    binds = {
        allow_workspace_cycles            = true,
        workspace_back_and_forth          = true,
        workspace_center_on               = 1,
        movefocus_cycles_fullscreen       = true,
        window_direction_monitor_fallback = true,
    },
})
