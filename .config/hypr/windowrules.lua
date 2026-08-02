-- =====================================================================
-- WINDOWS AND WORKSPACES
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- Rules are evaluated top to bottom — order matters!
-- =====================================================================

-- NOTE: $browser from hyprland.lua is not in scope here.
-- Either redeclare it, or require a shared variables module.
local browser = "vivaldi-stable"


-- ─────────────────────────────────────────────────────────────────────
-- No animations + full opacity apps
-- ─────────────────────────────────────────────────────────────────────
hl.window_rule({
    name  = "No anim + full opacity apps",
    match = {
        class = "^(vivaldi-stable|Vivaldi-stable|org.pwmt.zathura|obsidian|org.telegram.desktop|libreoffice.*)$",
    },

    -- Force 100% opacity for both active AND inactive states
    opacity  = "1.0 override",
    no_anim  = false,   -- off = false in Lua booleans
})


-- ─────────────────────────────────────────────────────────────────────
-- Suppress maximize
-- ─────────────────────────────────────────────────────────────────────
hl.window_rule({
    name  = "Suppress maximize",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})


-- ─────────────────────────────────────────────────────────────────────
-- XWayland helper windows
-- ─────────────────────────────────────────────────────────────────────
hl.window_rule({
    name  = "XWayland helper windows",
    match = {
        class    = "^$",
        xwayland = true,
    },

    float            = true,
    pin              = true,
    no_focus         = true,
    no_anim          = true,
    immediate        = true,
    opacity          = "1.0 override",
})


-- ─────────────────────────────────────────────────────────────────────
-- Follow link (browser focus on activate)
-- ─────────────────────────────────────────────────────────────────────
hl.window_rule({
    name  = "Follow link",
    match = {
        class = "^(" .. browser .. ")$",
    },

    focus_on_activate = true,
})


-- =====================================================================
-- UEBERZUGPP IMAGE PREVIEW RULES FOR RANGER
-- These rules make ueberzugpp overlay windows behave correctly
-- so image previews appear inside the terminal instead of new windows.
-- =====================================================================

-- Ueberzugpp image preview overlay (e.g. ueberzugpp_abc123)
hl.window_rule({
    name  = "Ueberzugpp image preview overlay",
    match = {
        class = "^(ueberzugpp_.*)$",
    },

    float             = true,
    no_anim           = true,
    no_focus          = true,
    no_initial_focus  = true,
    no_shadow         = true,
    no_blur           = true,
    border_size       = 0,
    rounding          = 0,
    opacity           = "1.0 override 1.0 override",
})


-- Ueberzugpp alternative pattern (bare class name)
hl.window_rule({
    name  = "Ueberzugpp alternative pattern",
    match = {
        class = "^(ueberzugpp)$",
    },

    float             = true,
    no_anim           = true,
    no_focus          = true,
    no_initial_focus  = true,
    no_shadow         = true,
    no_blur           = true,
    border_size       = 0,
    rounding          = 0,
    opacity           = "1.0 override 1.0 override",
})


-- Ueberzugpp matched by window title
hl.window_rule({
    name  = "Ueberzugpp by title",
    match = {
        title = "^(ueberzug.*)$",
    },

    float             = true,
    no_anim           = true,
    no_focus          = true,
    no_initial_focus  = true,
    no_shadow         = true,
    no_blur           = true,
    border_size       = 0,
    rounding          = 0,
    opacity           = "1.0 override 1.0 override",
})
