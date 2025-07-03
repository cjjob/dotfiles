-- Pull in the wezterm API
local wezterm = require("wezterm")

-- TODO: Get this working.
-- Keymaps are commented out below.
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrains Mono", { weight = "Medium", italic = false })
config.font_size = 13

-- Follow system light/dark mode.
local function get_appearance()
    -- Try to get appearance from wezterm API.
    -- If not available, fallback to dark mode.
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

local function scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "Tokyo Night (Gogh)"
    else
        return "Tokyo Night Light (Gogh)"
    end
end

-- config.color_scheme = scheme_for_appearance(get_appearance())
config.color_scheme = "Tokyo Night (Gogh)"

-- config.enable_tab_bar = false
-- https://wezterm.org/config/lua/config/window_decorations.html
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

local act = wezterm.action

-- Key mappings.
config.keys = {
    -- Split panes.
    {
        key = "v",
        mods = "SUPER|SHIFT",
        action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "h",
        mods = "SUPER|SHIFT",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    -- Focus panes.
    {
        key = "UpArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Up"),
    },
    {
        key = "DownArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Down"),
    },
    {
        key = "LeftArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Left"),
    },
    {
        key = "RightArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Right"),
    },
    -- Resize panes.
    {
        key = "i",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Up", 2 }),
    },
    {
        key = "k",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Down", 2 }),
    },
    {
        key = "j",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Left", 2 }),
    },
    {
        key = "l",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Right", 2 }),
    },

    -- Delete the whole line (SUPER+Backspace).
    {
        key = "Backspace",
        mods = "SUPER",
        action = act.SendKey({
            key = "u",
            mods = "CTRL",
        }),
    },
    -- Ignore CTRL+Down.
    -- TODO: My Copilot CTRL+Down isn't working.
    -- I thought WezTerm was intercepting. But, this hasn't fixed.
    {
        key = "DownArrow",
        mods = "CTRL",
        action = act.DisableDefaultAssignment,
    },
    -- -- resurrect.wezterm
    -- {
    --     key = 's',
    --     mods = 'SUPER',
    --     action = wezterm.action_callback(function(win, pane)
    --         resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
    --     end),
    -- },
    -- {
    --     key = 'r',
    --     mods = 'SUPER',
    --     action = wezterm.action_callback(function(win, pane)
    --         resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
    --             local type = string.match(id, '^([^/]+)') -- match before '/'
    --             id = string.match(id, '([^/]+)$') -- match after '/'
    --             id = string.match(id, '(.+)%..+$') -- remove file extention
    --             local opts = {
    --                 relative = true,
    --                 restore_text = true,
    --                 on_pane_restore = resurrect.tab_state.default_on_pane_restore,
    --             }
    --             if type == 'workspace' then
    --                 local state = resurrect.state_manager.load_state(id, 'workspace')
    --                 resurrect.workspace_state.restore_workspace(state, opts)
    --             elseif type == 'window' then
    --                 local state = resurrect.state_manager.load_state(id, 'window')
    --                 resurrect.window_state.restore_window(pane:window(), state, opts)
    --             elseif type == 'tab' then
    --                 local state = resurrect.state_manager.load_state(id, 'tab')
    --                 resurrect.tab_state.restore_tab(pane:tab(), state, opts)
    --             end
    --         end)
    --     end),
    -- },
    -- {
    --     key = 'd',
    --     mods = 'SUPER',
    --     action = wezterm.action_callback(function(win, pane)
    --         resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id)
    --             resurrect.state_manager.delete_state(id)
    --         end, {
    --             title = 'Delete State',
    --             description = 'Select State to Delete and press Enter = accept, Esc = cancel, / = filter',
    --             fuzzy_description = 'Search State to Delete: ',
    --             is_fuzzy = true,
    --         })
    --     end),
    -- },
}

-- and finally, return the configuration to wezterm
return config
