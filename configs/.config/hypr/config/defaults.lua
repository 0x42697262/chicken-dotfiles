-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Defaults Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

return {
	filemanager = "",
	applauncher = "pkill rofi || rofi -show combi -modi window,run,combi -combi-modi window,run",
	terminal = "kitty",
	idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'",
	capturing = "flameshot gui",
	screenshot = "flameshot full",
	-- capturing   = [[grim -g "$(slurp)" - | swappy -f -]],
	-- screenshot  = "grim - | swappy -f -",

	-- Monitors
	internal = "HDMI-A-1",
	external = "HDMI-A-2",
	viewpoint = "desc:Stargate Technology 0x2700 0x00001A0A",
	lg = "desc:LG Electronics LG TV 0x01010101",
	samsung = "desc:Samsung Electric Company LS24C33xG H9TX600204",
	sony4k = "desc:Sony SONY TV  *00 0x01010101",

	-- Keys
	left = "J",
	right = "Semicolon",
	up = "K",
	down = "L",
}
