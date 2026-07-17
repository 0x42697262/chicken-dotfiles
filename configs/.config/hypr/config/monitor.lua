-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/

-- local defaults = require("config/defaults")

-- hl.monitor({
--     output   = defaults.sony4k,
--     mode     = "3840x2160@60",
--     position = "0x0",
--     scale    = 1,
-- })

-- hl.monitor({
--     output   = defaults.viewpoint,
--     mode     = "1920x1080@75",
--     position = "0x0",
--     scale    = 1,
-- })

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@120",
	position = "auto",
	scale = 1,
})

-- If you need to scale things like steam etc, please uncomment these lines.
-- Adjust GDK_SCALE accordingly to your liking.
-- hl.config({
--     xwayland = {
--         force_zero_scaling = true, -- Unscale XWayland
--     },
-- })

-- hl.env("GDK_SCALE", "1.25") -- GDK Scaling Factor
