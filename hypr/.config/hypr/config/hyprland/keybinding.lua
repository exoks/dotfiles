--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀              𓐓 keybinding.lua 𓐔        
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/01/21 17:35:05 by oezzaou
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/11/26 16:36:25 by oezzaou
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

---@module 'hl'
-- ===[ hyprland: keybinding ]==================================================
-- HINT:> See https://wiki.hyprland.org/Configuring/Keywords/
local leader = "ALT"
local super = "SUPER"
local programs = require("config.hyprland.program")

-- Windwos Mark

-- HINT::> See https://wiki.hyprland.org/Configuring/Binds/ for more
-- INFO:> Kill active pane key-bind
hl.bind(leader .. " + " .. "C", hl.dsp.window.close())
-- INFO:> logout session key-bind
hl.bind(leader .. " + " .. "M", hl.dsp.exit())
-- INFO:> filemanager key-bind
hl.bind(leader .. " + " .. "E", hl.dsp.exec_cmd(programs.fileManager))
-- INFO:> rofi/wofi program launcher key-bind
hl.bind(leader .. " + " .. "SPACE", hl.dsp.exec_cmd(programs.launcher))
-- INFO:> Lock session screen
hl.bind(leader .. " + " .. "l", hl.dsp.exec_cmd("hyprlock"))
-- INFO:> Open terminal
-- bind = CTRL, RETURN, exec, $terminal
-- NOTE:> change wallpaper
-- `switcher` key binding prevents neovim from capturing CTRL + ' ' signal
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd(programs.switcher))
hl.bind(leader .. " + " .. "P", hl.dsp.window.pseudo())
-- dwindle
-- bind = $leader, J, togglesplit, # dwindle
-- bind = $leader, V, togglefloating,
hl.bind(leader .. " + " .. "J", hl.dsp.layout("togglesplit"))
hl.bind(leader .. " + " .. "V", hl.dsp.window.float())

-- NOTE:> Move focus with leader + arrow keys
hl.bind(super .. " + " .. "l", hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + " .. "h", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + " .. "k", hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + " .. "j", hl.dsp.focus({ direction = "down" }))

-- NOTE:> Switch workspaces with leader + [0-9]
hl.bind(leader .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(leader .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(leader .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(leader .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(leader .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(leader .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(leader .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(leader .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(leader .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(leader .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- NOTE:> Move active window to a workspace with leader + SHIFT + [0-9]
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- NOTE:> Example special workspace (scratchpad)
hl.bind(leader .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(leader .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

-- NOTE:> Scroll through existing workspaces with leader + scroll
hl.bind(leader .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(leader .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- NOTE:> Move/resize windows with leader + LMB/RMB and dragging
hl.bind(leader .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(leader .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- NOTE:> Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })

-- NOTE:> Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- NOTE:> require installing `sudo pacman -S grim slurp`
-- Full screenshot: [ Super + Print → full screenshot ]
hl.bind(super .. " + " .. "Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"))
-- NOTE:> require installing `sudo pacman -S slurp`
-- Select an area: [ Super + Shift + Print → select an area ]

hl.bind(super .. " + " .. "SHIFT" .. " + " .. "Print",
  hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"))
