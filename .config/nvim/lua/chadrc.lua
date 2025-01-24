-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvbox",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "                                         ",
        "         ___--=--------___",
        "        /. \\___\\____   _, \\_      /-\\",
        "       /. .  _______     __/=====@",
        "       \\----/  |  / \\______/      \\-/",
        "   _/         _/ o \\\\",
        "  / |    o   /  ___ \\\\",
        " / /    o\\\\ |  / O \\ /|      __-_",
        "|o|     o\\\\\\   |  \\ \\ /__--o/o___-_",
        "| |      \\\\\\-_  \\____  ----  o___-",
        "|o|       \\_ \\     /\\______-o\\_-",
        "| \\       _\\ \\  _/ / |",
        "\\o \\_   _/      __/ /",
        " \\   \\-/   _       /|_",
        "  \\_      / |   - \\  |\\\\",
        "    \\____/  \\ | /  \\   |\\\\",
        "            | o |   | \\ |",
        "            | | |    \\ | \\\\",
        "           / | /      \\ \\ \\\\",
        "         /|  \\o|\\--\\  /  o |\\--\\\\",
        "         \\----------' \\---------'",
        "                                   ",
    },
    buttons = {
        { txt = "Lazy", cmd = "Lazy" },
        { txt = " Select project", keys = "Spc f p", cmd = "Telescope projects" },
        { txt = "Quit", keys = "q", cmd = "q" },
    },
}
M.ui = {
    tabufline = {
        lazyload = false,
    },
}

return M
