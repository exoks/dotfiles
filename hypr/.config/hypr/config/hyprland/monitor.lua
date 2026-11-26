--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀               𓐓 monitor.lua 𓐔          
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/01/21 17:43:45 by oezzaou
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/11/25 16:32:51 by oezzaou
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

-- ===[ Monitors: config ]=====================================================
---@module 'hl'

-- ===[ Home: config ]===
-- monitor=eDP-1,preferred,0x0,auto
-- monitor=HDMI-A-2,preferred,1920x0,auto
-- monitor=HDMI-A-2,preferred,2880x0,auto

-- ===[ Lab: config ]===
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "960x1080",
    scale    = "auto",
})

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@60.00",
    position = "0x0",
    scale    = "auto",
})

hl.monitor({
    output   = "DP-4",
    mode     = "1920x1080@60.00",
    position = "1920x0",
    scale    = "auto",
})

-- Assigning 1 -> first workspace to eDP-1 monitor 
hl.workspace_rule({
    workspace = 1,
    monitor = "eDP-1",
})

-- Assigning 2 -> 5 workspaces to the HDMI-A-1 monitors 
-- workspace = 2, monitor:HDMI-A-1
-- workspace = 3, monitor:HDMI-A-1
-- workspace = 4, monitor:HDMI-A-1
-- workspace = 5, monitor:HDMI-A-1
-- Assigning 2 -> 5 workspaces to the HDMI-A-2 monitors 
-- workspace = 2, monitor:HDMI-A-2
-- workspace = 3, monitor:HDMI-A-2
-- workspace = 4, monitor:HDMI-A-2
-- workspace = 5, monitor:HDMI-A-2
-- workspace = 6, monitor:HDMI-A-2
-- workspace = 7, monitor:HDMI-A-2
-- workspace = 8, monitor:HDMI-A-2
-- workspace = 9, monitor:HDMI-A-2

-- Assigning 2 workspaces to the DP-3 monitor 
hl.workspace_rule({
    workspace = 2,
    monitor = "DP-3",
})

-- Assigning 3 -> 5 workspaces to the DP-4 monitor 
hl.workspace_rule({
    workspace = 3,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 4,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 5,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 6,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 7,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 8,
    monitor = "DP-4",
})

hl.workspace_rule({
    workspace = 9,
    monitor = "DP-4",
})

-- Assigning 2 -> 5 workspaces to the DP-6 monitors 
-- workspace = 2, monitor:DP-6
-- workspace = 3, monitor:DP-6
-- workspace = 4, monitor:DP-6
-- workspace = 5, monitor:DP-6

-- HINT:> See https://wiki.hyprland.org/Configuring/Monitors/
