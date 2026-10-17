hl.window_rule({
    name = "zen",
    match = {
        class = "^(zen)$",
    },
    workspace = "2 silent",
})

hl.window_rule({
    name = "code",
    match = {
        class = "^(com.microsoft.VSCode)$",
    },
    opacity = 0.9,
    workspace = "3 silent",
})

hl.window_rule({
    name = "steam",
    match = {
        class = "^(steam)$",
    },
    workspace = "4 silent",
})

