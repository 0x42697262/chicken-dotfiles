-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Input Configuration                    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Input wiki https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        follow_mouse                = 2, -- 0|1|2|3
        float_switch_override_focus = 2,
        numlock_by_default          = true,
        scroll_method               = "2fg", -- easier for my movements than using "edge"

        touchpad = {
            natural_scroll       = true,
            disable_while_typing = true,
            scroll_factor        = 0.7,
            -- clickfinger_behavior = true,
        },
    },
})
