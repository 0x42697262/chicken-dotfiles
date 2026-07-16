-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Decorations Configuration                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
    decoration = {
        active_opacity   = 0.95,
        inactive_opacity = 0.99,
        rounding         = 2,

        blur = {
            ignore_opacity    = false,
            new_optimizations = true,
            passes            = 3, -- more passes = more resource intensive.
            size              = 2,
            xray              = true,
        },

        shadow = {
            enabled = false,
        },
    },
})
