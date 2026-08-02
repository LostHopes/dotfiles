-- =====================================================================
-- INPUT
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- =====================================================================


-- ─────────────────────────────────────────────────────────────────────
-- Keyboard and mouse input
-- ─────────────────────────────────────────────────────────────────────

hl.config({
    input = {
        kb_layout  = "us,ru,ua",
        kb_variant = "",           -- empty: system default
        kb_model   = "",           -- empty: system default
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",           -- empty: system default

        follow_mouse = 1,          -- 1: cursor focus follows mouse

        sensitivity = 0,           -- -1.0 to 1.0, 0 = no modification

        touchpad = {
            natural_scroll = false,
        },
    },
})


-- ─────────────────────────────────────────────────────────────────────
-- Gestures
-- See https://wiki.hypr.land/Configuring/Gestures/
-- ─────────────────────────────────────────────────────────────────────

-- 3-finger horizontal swipe to switch workspaces
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})


-- ─────────────────────────────────────────────────────────────────────
-- Per-device input config
-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs
-- ─────────────────────────────────────────────────────────────────────

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
