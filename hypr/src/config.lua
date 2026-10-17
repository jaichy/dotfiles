hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,

        col = {
            active_border = "rgba(e95378ee)",
            inactive_border = "rgba(2e303ecc)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    xwayland = {
        force_zero_scaling = true,
         use_nearest_neighbor = false,
    },


    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1,
        inactive_opacity = 0.8,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})


hl.config({
    master = {
        new_status = "master",
    },
})


hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})