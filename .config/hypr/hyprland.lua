-- =====================================================================
-- HYPRLAND LUA CONFIG (0.55+)
-- Refer to the wiki for more information:
-- https://wiki.hypr.land/Configuring/Start/
-- =====================================================================


--------------------
---   MONITORS   ---
--------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---   AUTOSTART   ---
---------------------

-- Autostart necessary processes (like notification daemons, status bars, etc.)
-- hl.on("hyprland.start", ...) ensures commands run only once at boot,
-- not on config reload.

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("eval $(keychain --eval --quiet --agents ssh id_ed25519)")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)


---------------------------------
---  ENVIRONMENT VARIABLES    ---
---------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")


-----------------------
---   PERMISSIONS   ---
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Permission changes require a Hyprland restart (not applied on-the-fly)

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-------------------------
---   LOOK AND FEEL   ---
-------------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,
        
        col = {
          active_border   = "rgba(D65D0Eff)",
          inactive_border = "rgba(98971aff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity    = 0.9,
        inactive_opacity  = 0.9,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    dwindle = {
        preserve_split = true,  -- You probably want this
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true,  -- If true disables the random hyprland logo / anime girl background. :(
        focus_on_activate       = false,
    },
})


-------------------------
---   INCLUDE FILES   ---
-------------------------

-- require() replaces source = and creates separate Lua scopes
require("windowrules")
require("keybindings")
require("animations")
require("input")
