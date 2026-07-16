-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local colors = require("config/colors")

-- Variables wiki https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 5,
        border_size = 2,
        col = {
            active_border   = colors.cachylgreen,
            inactive_border = colors.cachymblue,
        },
        layout        = "dwindle", -- master|dwindle
        allow_tearing = true,

        snap = {
            enabled = true,
        },
    },

    gestures = {
        workspace_swipe_distance           = 500,
        workspace_swipe_min_speed_to_force = 15,
        workspace_swipe_create_new         = false,
    },

    group = {
        col = {
            border_active          = colors.cachydgreen,
            border_inactive        = colors.cachylgreen,
            border_locked_active   = colors.cachymgreen,
            border_locked_inactive = colors.cachydblue,
        },

        groupbar = {
            font_family   = "Fira Sans",
            text_color    = colors.cachydblue,
            col = {
                active          = colors.cachylgreen,
                inactive        = colors.cachydgreen,
                locked_active   = colors.cachymgreen,
                locked_inactive = colors.cachydblue,
            },
            height        = 1,
            render_titles = false,
        },
    },

    misc = {
        font_family                  = "Fira Sans",
        splash_font_family           = "Fira Sans",
        disable_hyprland_logo        = true,
        disable_splash_rendering     = true,
        col = {
            splash = colors.cachylgreen,
        },
        background_color             = colors.cachydblue,
        enable_swallow               = true,
        swallow_regex                = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate            = true,
        vrr                          = 2,
        animate_mouse_windowdragging = true,
    },

    render = {
        direct_scanout = 1,
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
    dwindle = {
        special_scale_factor = 0.8,
        preserve_split       = true,
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
    master = {
        new_status           = "master",
        special_scale_factor = 0.8,
    },
})
