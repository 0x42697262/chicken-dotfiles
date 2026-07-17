-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local d = require("config/defaults")

local LMB = "mouse:272"
local RMB = "mouse:273"
local KP_1 = "code:87"

local workspace_keys = { "1", "2", "3", "4", "q", "w", "e", "r", "a", "s", "d", "f" }
local workspace_actions = {}
for _, key in ipairs(workspace_keys) do
	local workspace = "name:" .. key
	workspace_actions[#workspace_actions + 1] = hl.dsp.focus({ workspace = workspace })
	workspace_actions[#workspace_actions + 1] = hl.dsp.window.move({ workspace = workspace })
	workspace_actions[#workspace_actions + 1] = hl.dsp.window.move({ workspace = workspace, follow = false })
end

-- ======= Keymap =======
--
-- One entry per logical keybind: the action is defined once, the key specs for
-- both systems sit side by side.
--
--   entry = {
--       bind   = "<hl.bind key string>" | { ... }, -- plain hyprland bind spec(s)
--       chord  = "<STEP ; STEP ...>",              -- hyprchords chain spec (steps only)
--       action = <dispatcher|function|string> | { ... }, -- what fires
--       opts   = { ... },                          -- hl.bind options (plain bind only)
--   }
--
-- action forms:
--   HL.Dispatcher / lua function -> usable by both hl.bind and chord
--   string "dispatcher , arg"    -> chord-only legacy form (command expansion/cycling)
--   array                         -> paired with the chord's brace expansions and bind array
--
-- Registration (bottom of file): with the hyprchords plugin loaded, entries
-- with a chord spec register as chords (bind spec ignored); otherwise the bind
-- spec is used. Bind-only entries always register as plain binds.

-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Binds/ (chords: see hyprchords README)
local keymap = {
	-- ======= Apps =======
	{
		action = hl.dsp.exec_cmd(d.terminal),
		bind = "SUPER + RETURN",
		chord = "SUPER+RETURN",
	},
	{
		action = hl.dsp.exec_cmd(d.filemanager),
		bind = "SUPER + E",
	},
	{
		action = hl.dsp.exec_cmd(d.capturing),
		bind = "SUPER + SHIFT + S",
		chord = "SUPER + SHIFT + S",
	},
	{
		action = hl.dsp.exec_cmd(d.screenshot),
		bind = "PRINT",
		chord = "PRINT",
	},
	{
		action = hl.dsp.exec_cmd([[loginctl terminate-user ""]]),
		bind = "SUPER + CTRL + ALT + F4",
		chord = "SUPER + CTRL + ALT + F4",
	},
	{
		action = hl.dsp.exec_cmd(d.applauncher),
		bind = "ALT + SPACE",
		chord = "ALT + SPACE",
	},
	{
		action = hl.dsp.exec_cmd("systemctl suspend"),
		bind = "SUPER + HOME",
		chord = "SUPER + HOME",
	},
	{
		action = hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"),
		bind = "SUPER + L",
		chord = "SUPER + L",
	},
	{
		action = hl.dsp.exec_cmd("killall -SIGUSR2 waybar"),
		bind = "SUPER + ALT + " .. KP_1,
		chord = "SUPER + ALT + " .. KP_1,
	},
	{
		action = hl.dsp.exec_cmd("firefox"),
		chord = "SUPER+X ; F",
	},
	{
		action = hl.dsp.exec_cmd("qalculate-gtk"),
		bind = "XF86Calculator",
		chord = "any+XF86Calculator",
	},

	-- ':' = locked mode: stays at the chain tail, repeat the final key freely,
	-- no timeout; only abort_key exits
	{
		action = hl.dsp.window.resize({
			x = -40,
			y = 0,
			relative = true,
		}),
		chord = "SUPER+R : H",
	},
	{
		action = hl.dsp.window.resize({
			x = 40,
			y = 0,
			relative = true,
		}),
		chord = "SUPER+R : L",
	},

	-- command-only {} groups cycle per press (sxhkd cycling) -> legacy string action
	-- (note: `hyprctl keyword` no longer works on the lua config backend)
	{
		action = "exec , notify-send cycle-{one,two,three}",
		chord = "SUPER+ALT+P",
	},

	-- ======= Windows =======
	{
		action = hl.dsp.window.fullscreen({ mode = "maximized" }),
		bind = "SUPER + CTRL + F",
		chord = "SUPER + CTRL + F",
	}, -- monocle
	{
		action = hl.dsp.window.fullscreen_state({
			internal = 0,
			client = 2,
		}),
		bind = "SUPER + SHIFT + F",
		chord = "SUPER + SHIFT + F",
	}, -- fake fullscreen
	{
		action = hl.dsp.window.fullscreen(),
		bind = "SUPER + F",
		chord = "SUPER + F",
	},
	{
		action = hl.dsp.window.close(),
		bind = "ALT + F4",
		chord = "ALT + F4",
	},
	{
		action = hl.dsp.window.kill(),
		bind = "SUPER + ALT + F4",
		chord = "SUPER + ALT + F4",
	},
	{
		action = hl.dsp.window.float(),
		bind = "ALT_R + F",
		chord = "ALT_R + F",
	},
	{
		action = hl.dsp.window.center(),
		bind = "ALT_R + C",
		chord = "ALT_R + C",
	},
	{
		action = hl.dsp.layout("togglesplit"),
		bind = "ALT_R + S",
		chord = "ALT_R + S",
	}, -- dwindle, needs preserve_split
	{
		action = hl.dsp.window.pin(),
		bind = "ALT_R + Y",
		chord = "ALT_R + Y",
	},
	{
		action = hl.dsp.window.resize(),
		bind = "SUPER + " .. RMB,
		opts = {
			mouse = true,
		},
	}, -- Resize the window towards a direction
	{
		action = hl.dsp.window.drag(),
		bind = "SUPER + " .. LMB,
		opts = {
			mouse = true,
		},
	}, -- Drag window

	-- ======= Grouping Windows =======
	{
		action = hl.dsp.group.toggle(),
		bind = "SUPER + G",
		chord = "SUPER + G",
	},

	{
		action = hl.dsp.window.move({
			out_of_group = true,
		}),
		bind = "SUPER + SHIFT + G",
		chord = "SUPER + SHIFT + G",
	},

	{
		action = hl.dsp.group.prev(),
		chord = "SUPER + A; G; SHIFT+TAB",
		opts = {
			repeating = true,
		},
	},
	{
		action = hl.dsp.group.next(),
		chord = "SUPER + A; G; TAB",
		opts = {
			repeating = true,
		},
	},
	-- ======= Toggle Gaps =======

	{
		action = function()
			hl.config({ general = { gaps_out = 5, gaps_in = 3 } })
		end,
		chord = "SUPER + H; SHIFT + G",
		opts = { description = "Set CachyOS default gaps" },
	},
	{
		action = function()
			hl.config({ general = { gaps_out = 0, gaps_in = 0 } })
		end,
		chord = "SUPER + H; G",
		opts = { description = "Remove gaps between window" },
	},

	-- ======= Volume Control =======
	{
		action = hl.dsp.exec_cmd(
			[[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]
		),
		bind = "XF86AudioRaiseVolume",
		chord = "any+XF86AudioRaiseVolume",
		opts = {
			repeating = true,
			locked = true,
		},
	}, -- Raise Volume
	{
		action = hl.dsp.exec_cmd(
			[[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]
		),
		bind = "XF86AudioLowerVolume",
		chord = "any+XF86AudioLowerVolume",
		opts = {
			repeating = true,
			locked = true,
		},
	}, -- Lower Volume
	{
		action = hl.dsp.exec_cmd(
			[[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]
		),
		bind = "XF86AudioMute",
		chord = "any+XF86AudioMute",
		opts = {
			repeating = true,
			locked = true,
		},
	}, -- Mutes player audio

	-- ======= Playback Control =======
	{
		action = hl.dsp.exec_cmd("playerctl play-pause"),
		bind = "XF86AudioPlay",
		chord = "any+XF86AudioPlay",
		opts = {
			description = "Toggles play/pause",
		},
	},
	{
		action = hl.dsp.exec_cmd("playerctl next"),
		bind = "XF86AudioNext",
		chord = "any+XF86AudioNext",
		opts = {
			description = "Next track",
		},
	},
	{
		action = hl.dsp.exec_cmd("playerctl previous"),
		bind = "XF86AudioPrev",
		chord = "any+XF86AudioPrev",
		opts = {
			description = "Previous track",
		},
	},

	-- ======= Screen Brightness =======
	{
		action = hl.dsp.exec_cmd("brightnessctl s +5%"),
		bind = "XF86MonBrightnessUp",
		chord = "any+XF86MonBrightnessUp",
		opts = {
			repeating = true,
			locked = true,
		},
	}, -- Increases brightness 5%
	{
		action = hl.dsp.exec_cmd("brightnessctl s 5%-"),
		bind = "XF86MonBrightnessDown",
		chord = "any+XF86MonBrightnessDown",
		opts = {
			repeating = true,
			locked = true,
		},
	}, -- Decreases brightness 5%

	-- ======= Window Actions =======
	-- Move window towards a direction
	{
		action = {
			hl.dsp.window.move({ direction = "l" }),
			hl.dsp.window.move({ direction = "r" }),
			hl.dsp.window.move({ direction = "u" }),
			hl.dsp.window.move({ direction = "d" }),
		},
		bind = {
			"SHIFT + ALT_R + " .. d.left,
			"SHIFT + ALTR_R + " .. d.right,
			"SHIFT + ALT_R + " .. d.up,
			"SHIFT + ALT_R + " .. d.down,
		},
		chord = ("SHIFT + ALT_R + {%s,%s,%s,%s}"):format(d.left, d.right, d.up, d.down),
	},

	-- Move focus with MOD + arrow keys
	{
		action = {
			hl.dsp.focus({ direction = "l" }),
			hl.dsp.focus({ direction = "r" }),
			hl.dsp.focus({ direction = "u" }),
			hl.dsp.focus({ direction = "d" }),
		},
		bind = {
			"ALT_R + " .. d.left,
			"ALTR_R + " .. d.right,
			"ALT_R + " .. d.up,
			"ALT_R + " .. d.down,
		},
		chord = ("ALT_R + {%s,%s,%s,%s}"):format(d.left, d.right, d.up, d.down),
	},

	-- Quick resize window with keyboard
	{
		action = {
			hl.dsp.window.resize({ x = -15, y = 0, relative = true }),
			hl.dsp.window.resize({ x = 15, y = 0, relative = true }),
			hl.dsp.window.resize({ x = 0, y = -15, relative = true }),
			hl.dsp.window.resize({ x = 0, y = 15, relative = true }),
		},
		bind = {
			"CTRL + SHIFT + ALT_R + " .. d.right,
			"CTRL + SHIFT + ALT_R + " .. d.left,
			"CTRL + SHIFT + ALT_R + " .. d.up,
			"CTRL + SHIFT + ALT_R + " .. d.down,
		},
		chord = ("CTRL + SHIFT + ALT_R + {%s,%s,%s,%s}"):format(d.left, d.right, d.up, d.down),
		opts = {
			repeating = true,
		},
	},

	-- Cycle
	{
		action = {
			hl.dsp.window.cycle_next({ next = true }),
			hl.dsp.window.cycle_next({ next = false }),
			hl.dsp.window.cycle_next({ next = true, tiled = true }),
			hl.dsp.window.cycle_next({ next = false, tiled = true }),
		},
		bind = {
			"ALT + TAB",
			"ALT + SHIFT + TAB",
			"ALT + CTRL + TAB",
			"ALT + CTRL + SHIFT + TAB",
		},
		chord = "ALT + {_,SHIFT+,CTRL+,CTRL+SHIFT+}TAB",
		opts = {
			repeating = true,
		},
	},

	-- Move active window to a workspace
	{
		action = {
			hl.dsp.window.move({ workspace = "+1" }),
			hl.dsp.window.move({ workspace = "-1" }),
		},
		chord = "SUPER + W; {_,SHIFT+}CTRL + Tab",
	},

	-- ======= Workspace Actions =======
	-- Scroll through existing workspaces with MOD + TAB
	{
		action = {
			hl.dsp.focus({ workspace = "e+1" }),
			hl.dsp.focus({ workspace = "e-1" }),
			hl.dsp.focus({ workspace = "previous" }),
		},
		chord = "SUPER + W; {_,SHIFT+,ALT+}Tab",
		opts = {
			repeating = true,
		},
	},

	-- With SUPER + scroll
	{
		action = {
			hl.dsp.focus({ workspace = "e+1" }),
			hl.dsp.focus({ workspace = "e-1" }),
		},
		bind = {
			"SUPER + mouse_down",
			"SUPER + mouse_up",
		},
		chord = "SUPER + {mouse_down,mouse_up}",
	},

	-- Special workspaces (scratchpads)
	{
		action = {
			hl.dsp.workspace.toggle_special("notes"),
			hl.dsp.window.move({ workspace = "special:notes" }),
		},
		bind = {
			"SUPER + equal",
			"SUPER + SHIFT + equal",
		},
		chord = "SUPER + {_,SHIFT+}equal",
	},
	{
		action = {
			hl.dsp.workspace.toggle_special("scratchpad"),
			hl.dsp.window.move({ workspace = "special:scratchpad" }),
			hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }),
		},
		bind = {
			"SUPER + F1",
			"SUPER + SHIFT + F1",
			"SUPER + ALT + SHIFT + F1",
		},
		chord = "SUPER + {_,SHIFT+,ALT+SHIFT+}F1",
	},
	{
		action = {
			hl.dsp.workspace.toggle_special("tools"),
			hl.dsp.window.move({ workspace = "special:tools" }),
			hl.dsp.window.move({ workspace = "special:tools", follow = false }),
		},
		bind = {
			"SUPER + F2",
			"SUPER + SHIFT + F2",
			"SUPER + ALT + SHIFT + F2",
		},
		chord = "SUPER + {_,SHIFT+,ALT+SHIFT+}F2",
	},

	-- Monitor
	{
		action = {
			hl.dsp.workspace.swap_monitors({ monitor1 = d.internal, monitor2 = d.external }),
			hl.dsp.focus({ monitor = d.external }),
			hl.dsp.focus({ monitor = d.internal }),
		},
		chord = "SUPER + M; {comma,period,slash}",
	},

	-- Named workspaces: switch / move window / move window without following
	{
		action = workspace_actions,
		chord = "SUPER + W; {_,SHIFT+,CTRL+}{" .. table.concat(workspace_keys, ",") .. "}",
	},
}

-- ======= Additional Settings =======

-- https://wiki.hypr.land/Configuring/Basics/Variables/#binds
hl.config({
	binds = {
		allow_workspace_cycles = true,
		workspace_back_and_forth = true,
		workspace_center_on = 1,
		movefocus_cycles_fullscreen = true,
		window_direction_monitor_fallback = true,
	},
})

if hl.plugin.hyprchords then
	hl.config({
		plugin = {
			hyprchords = {
				timeout = 3000, -- ms a pending chain stays alive; 0 = no timeout
				abort_key = "Escape", -- key that aborts a pending chain
				sticky_mods = 1, -- modless steps also match with the previous step's mods held
				swallow = 1, -- 1: unmatched keys abort the chain and are swallowed
				-- 0: they pass to apps, chain stays pending (sxhkd behavior)
			},
		},
	})
end

-- ======= Registration =======

local hc = hl.plugin.hyprchords
local function register_one(chord, bind, action, opts)
	if hc and chord then
		local ok, err
		if type(action) == "string" then
			ok, err = pcall(hc.chord, chord .. " , " .. action)
		elseif type(action) == "function" then
			ok, err = pcall(hc.chord, chord, action)
		else
			ok, err = pcall(hc.chord, chord, function()
				hl.dispatch(action)
			end)
		end
		if ok then
			return
		end
		-- e.g. an older plugin build without lua-action support: fall back to the plain bind
		print(("keybinds: chord '%s' failed (%s), falling back to bind"):format(chord, tostring(err)))
	end
	if bind then
		hl.bind(bind, action, opts)
	end
end

local function trim(value)
	return value:match("^%s*(.-)%s*$")
end

local function group_values(raw)
	local value = trim(raw)
	if value == "_" then
		return { "" }
	end

	local first, last = value:match("^([%w])%-([%w])$")
	local same_kind = first and ((first:match("%d") and last:match("%d")) or (first:match("%a") and last:match("%a")))
	if not same_kind or first:byte() > last:byte() then
		return { value }
	end

	local values = {}
	for byte = first:byte(), last:byte() do
		values[#values + 1] = string.char(byte)
	end
	return values
end

local function expand_chord(chord)
	local literals = {}
	local groups = {}
	local current = {}
	local i = 1

	while i <= #chord do
		local char = chord:sub(i, i)
		local next_char = chord:sub(i + 1, i + 1)
		if char == "\\" and (next_char == "{" or next_char == "}") then
			current[#current + 1] = char .. next_char
			i = i + 2
		elseif char == "{" then
			literals[#literals + 1] = table.concat(current)
			current = {}

			local values = {}
			local element = {}
			i = i + 1
			while i <= #chord and chord:sub(i, i) ~= "}" do
				char = chord:sub(i, i)
				next_char = chord:sub(i + 1, i + 1)
				if char == "\\" and (next_char == "{" or next_char == "}") then
					element[#element + 1] = char .. next_char
					i = i + 2
				elseif char == "{" then
					error("keybinds: nested '{' in chord '" .. chord .. "'", 0)
				elseif char == "," then
					for _, value in ipairs(group_values(table.concat(element))) do
						values[#values + 1] = value
					end
					element = {}
					i = i + 1
				else
					element[#element + 1] = char
					i = i + 1
				end
			end
			if i > #chord then
				error("keybinds: unmatched '{' in chord '" .. chord .. "'", 0)
			end
			for _, value in ipairs(group_values(table.concat(element))) do
				values[#values + 1] = value
			end
			groups[#groups + 1] = values
			i = i + 1
		elseif char == "}" then
			error("keybinds: unmatched '}' in chord '" .. chord .. "'", 0)
		else
			current[#current + 1] = char
			i = i + 1
		end
	end
	literals[#literals + 1] = table.concat(current)

	if #groups == 0 then
		return { chord }
	end

	local total = 1
	for _, group in ipairs(groups) do
		total = total * #group
		if total > 512 then
			error("keybinds: chord expansion exceeds 512 entries: '" .. chord .. "'", 0)
		end
	end

	local expanded = {}
	local indices = {}
	for group = 1, #groups do
		indices[group] = 1
	end

	while true do
		local parts = { literals[1] }
		for group = 1, #groups do
			parts[#parts + 1] = groups[group][indices[group]]
			parts[#parts + 1] = literals[group + 1]
		end
		expanded[#expanded + 1] = table.concat(parts)

		local group = 1
		while group <= #groups do
			indices[group] = indices[group] + 1
			if indices[group] <= #groups[group] then
				break
			end
			indices[group] = 1
			group = group + 1
		end
		if group > #groups then
			break
		end
	end

	return expanded
end

local function register(e)
	local grouped = type(e.action) == "table" and rawget(e.action, 1) ~= nil
	if not grouped then
		register_one(e.chord, e.bind, e.action, e.opts)
		return
	end

	local chords = e.chord and expand_chord(e.chord) or {}
	if e.chord and #chords ~= #e.action then
		error(("keybinds: chord expands to %d entries but has %d actions: '%s'"):format(#chords, #e.action, e.chord), 0)
	end
	if e.bind and (type(e.bind) ~= "table" or #e.bind ~= #e.action) then
		error(
			("keybinds: grouped entry has %d actions but does not have the same number of binds"):format(#e.action),
			0
		)
	end

	for i, action in ipairs(e.action) do
		register_one(chords[i], e.bind and e.bind[i], action, e.opts)
	end
end

for _, e in ipairs(keymap) do
	register(e)
end
