-- Hyprland loads this file when it is started without a config, and it prefers
-- it over hyprland.conf. HyDE loads it too, last, as the override layer below.
-- The block keeps the two apart: hyde.lua sets `hyde` on its first line, so it
-- runs only when this file is the entry point and HyDE has not been loaded.
-- Removing it leaves a session with a cursor and nothing else.
if not hyde then
	local share = os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share")
	local entry = share .. "/hypr/hyde.lua"
	local handle = io.open(entry, "r")
	if not handle then
		error("HyDE is not installed at " .. entry .. ". Run install.sh -r, or point Hyprland at your own config.")
	end
	handle:close()
	dofile(entry)
end

-- Your Hyprland configuration. HyDE never overwrites this file.
--
-- It loads after HyDE's own binds, so settings here take precedence. Replacing
-- a bind needs more than that: see below. HyDE's defaults live in
-- ~/.local/share/hypr/lua/ and are overwritten on every update, so edits there
-- do not survive.
--
-- Adding a keybind:
--
--     hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(hyde.sh.gamelauncher()), {
--         description = "[Utilities] game launcher",
--     })
--
-- Replacing one of HyDE's: bind the same combination again and yours takes
-- over, but copy its flags across as well. A bind counts as the same one only
-- when its flags match, and `description` is not a flag — miss one and both
-- binds stay live on that combination. Copy the whole options table from
-- ~/.local/share/hypr/lua/key_binds.lua and change only what you need:
--
--     hl.bind("F9", hl.dsp.exec_cmd(hyde.sh.volumecontrol("-o", "m")), {
--         locked = true,
--         description = "[Hardware Controls|Audio] un/mute output",
--     })
--
-- Press SUPER + / to see what is actually loaded, your own binds included.
-- The full reference is KEYBINDINGS.md in the HyDE repository.
--
-- Other Lua files next to this one can be pulled in with require("name").

-- =========================================================
-- Voidbound Nova — UI
-- =========================================================

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 10,
        border_size = 2,
    },

    decoration = {
        rounding = 10,

        blur = {
            enabled = true,
            size = 6,
            passes = 2,
        },
    },
})

-- =========================================================
-- Voidbound Nova — Window Feel
-- =========================================================

hl.config({
    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 0.94,

        shadow = {
            enabled = true,
            range = 12,
            render_power = 3,
        },
    },

    general = {
        resize_on_border = true,
        extend_border_grab_area = 15,
    },
})

-- Fast, clean Voidbound animations

hl.curve("voidboundFast", {
    type = "bezier",
    points = {
        {0.16, 1.0},
        {0.30, 1.0},
    },
})

hl.curve("voidboundSmooth", {
    type = "bezier",
    points = {
        {0.22, 1.0},
        {0.36, 1.0},
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "voidboundFast",
    style = "popin 92%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    bezier = "voidboundFast",
    style = "popin 92%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "voidboundFast",
    style = "popin 92%",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "voidboundSmooth",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "voidboundSmooth",
    style = "slide",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 5,
    bezier = "voidboundFast",
})
