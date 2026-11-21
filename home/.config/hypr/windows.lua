-- Personal window rules.

-- Firefox opens on workspace 1.
o.window("firefox", { workspace = "1" })

-- Discord lives in the scratchpad special workspace (SUPER + S to toggle).
o.window("discord", { workspace = "special:scratchpad" })

-- Foot opens on workspace 2.
o.window("(foot|org\\.codeberg\\.dnkl\\.foot)", { workspace = "2" })
