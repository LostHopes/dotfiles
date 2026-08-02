-- =====================================================================
-- KEYBINDINGS
-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- =====================================================================

local programs = require("programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier


-- ─────────────────────────────────────────────────────────────────────
-- App binds
-- ─────────────────────────────────────────────────────────────────────

hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(programs.terminal))              -- plain binary, no args → exec_cmd ok
hl.bind(mainMod .. " + Q", hl.dsp.window.close())                             -- no args → bare reference, no ()
-- hl.bind(mainMod .. " + M", hl.dsp.exit)                                  -- no args → bare reference, no ()
hl.bind(mainMod .. " + I", function() hl.exec_cmd(programs.fileManager) end) -- "alacritty -e ranger" has args → wrap
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))               -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.reader))                -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(programs.notes))                 -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(programs.messanger))             -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(programs.music))                 -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(programs.editor))                -- plain binary → exec_cmd ok
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))      -- has args → () ok
hl.bind(mainMod .. " + space", function() hl.exec_cmd(programs.menu) end)   -- "wofi --show drun" has args → wrap
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())                            -- no args → bare reference, no ()
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" })) -- has args → () ok


-- ─────────────────────────────────────────────────────────────────────
-- Move focus with mainMod + arrow keys
-- ─────────────────────────────────────────────────────────────────────

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


-- ─────────────────────────────────────────────────────────────────────
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- ─────────────────────────────────────────────────────────────────────

for i = 1, 10 do
    local key = i % 10  -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- ─────────────────────────────────────────────────────────────────────
-- Alt Tab
-- ─────────────────────────────────────────────────────────────────────

hl.config({
    binds = {
        allow_workspace_cycles = true,
    },
})

hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))


-- ─────────────────────────────────────────────────────────────────────
-- Special workspace (scratchpad)
-- ─────────────────────────────────────────────────────────────────────

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- ─────────────────────────────────────────────────────────────────────
-- Scroll through workspaces with mainMod + scroll wheel
-- ─────────────────────────────────────────────────────────────────────

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))


-- ─────────────────────────────────────────────────────────────────────
-- Move/resize windows with mainMod + LMB/RMB and dragging
-- ─────────────────────────────────────────────────────────────────────

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- no args → bare reference
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- no args → bare reference


-- ─────────────────────────────────────────────────────────────────────
-- Laptop multimedia keys for volume and LCD brightness
-- All wpctl/brightnessctl calls have flags → must wrap in functions
-- ─────────────────────────────────────────────────────────────────────

hl.bind("XF86AudioRaiseVolume",  function() hl.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") end, { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume",  function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") end,      { repeating = true, locked = true })
hl.bind("XF86AudioMute",         function() hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") end,     { repeating = true, locked = true })
hl.bind("XF86AudioMicMute",      function() hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") end,   { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp",   function() hl.exec_cmd("brightnessctl -e4 -n2 set 5%+") end,                 { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", function() hl.exec_cmd("brightnessctl -e4 -n2 set 5%-") end,                 { repeating = true, locked = true })


-- ─────────────────────────────────────────────────────────────────────
-- Media keys — requires playerctl
-- playerctl calls have args → must wrap in functions
-- ─────────────────────────────────────────────────────────────────────

hl.bind("XF86AudioNext",  function() hl.exec_cmd("playerctl next") end,       { locked = true })
hl.bind("XF86AudioPause", function() hl.exec_cmd("playerctl play-pause") end, { locked = true })
hl.bind("XF86AudioPlay",  function() hl.exec_cmd("playerctl play-pause") end, { locked = true })
hl.bind("XF86AudioPrev",  function() hl.exec_cmd("playerctl previous") end,   { locked = true })
