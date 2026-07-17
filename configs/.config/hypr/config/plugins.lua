-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                          Plugins                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Plugins are managed by hyprpm (hyprpm enable <name>); this loads every
-- enabled plugin into the fresh instance. Plugin-dependent config (e.g. the
-- hyprchords chords in keybinds.lua) is guarded by `if hl.plugin.<name>` and
-- applies on the config reload that follows the plugins coming up.
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpm reload -n")
end)
