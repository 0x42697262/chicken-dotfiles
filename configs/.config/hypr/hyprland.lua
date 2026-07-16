-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 CachyOS Hyprland Configuration              ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- Since Hyprland 0.55, hyprlang (.conf) is deprecated in favor of Lua.
-- This file is loaded instead of hyprland.conf when present.
-- https://wiki.hypr.land/Configuring/Start/

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Source Files                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config/animations")
require("config/autostart")
require("config/decorations")
require("config/environment")
require("config/input")
require("config/keybinds")
require("config/monitor")
require("config/variables")
require("config/windowrules")

-- Modifying these configs can be done by creating a user defined config in the home directory, e.g.
--   ~/.config/hypr/config/user-config.lua
-- pcall(require, "config/user-config")
