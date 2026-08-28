-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-attached', function(domain)
  local workspace = mux.get_active_workspace()

  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)

local config = wezterm.config_builder()

config.color_scheme = 'tokyonight'

config.window_background_opacity = 0.75
config.wayland_window_background_blur = true

config.font = wezterm.font 'FiraMono Nerd Font Mono'
config.window_decorations = 'NONE'

config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = 'f',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ToggleAlwaysOnTop,
  },
  {
    key = 's',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SwitchToWorkspace {
      name = 'scratch',
    },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'WORKSPACES',
    },
  },
}

return config
