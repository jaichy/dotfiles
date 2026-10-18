require("src/env")
require("src/config")
require("src/animations")
require("src/windowrules")

hl.monitor({
    output = "DP-4",
    mode = "2560x1440@165",
    position = "auto",
    scale = 1.25,
})

local mainMod = "SUPER"

local terminal = "alacritty"
local fileManager = " "
local menu = "fuzzel"

local editor = "code"
local browser = "zen-browser"
local music = "spotify"


hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0")
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 50")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3-dark\"")
    
    hl.exec_cmd(terminal, { workspace = "1" })
    hl.exec_cmd(music, { workspace = "1"})
    hl.exec_cmd("discord", { workspace = "1"})
    
    
    hl.exec_cmd(browser, { workspace = "2" })
    hl.exec_cmd(editor, { workspace = "3" })

    hl.exec_cmd("steam", { workspace = "4" })
end)




hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd(menu)
)


hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close()
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)

-- Hyprland shutdown / exit
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
    )
)
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd(
        "hyprlock"
    )
)




hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)



for i = 1, 10 do
    local key = i % 10

    -- SUPER + 1..9, SUPER + 0
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    -- SUPER + SHIFT + 1..9, SUPER + SHIFT + 0
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

hl.bind(
  "ALT + o",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { repeating = true }
)

hl.bind(
  "ALT + p",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { repeating = true }
)

hl.bind(
  "ALT + i",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)

hl.bind(
  "ALT + u",
  hl.dsp.exec_cmd("playerctl play-pause")
)