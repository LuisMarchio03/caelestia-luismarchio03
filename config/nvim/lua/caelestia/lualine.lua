-- Caelestia lualine theme
local c = {
  bg      = "#131317",
  bg_dark = "#0e0e11",
  bg1     = "#1f1f23",
  bg2     = "#2a292e",
  overlay = "#46464f",
  fg      = "#e5e1e7",
  fg1     = "#c7c5d1",
  fg2     = "#918f9a",
  accent  = "#bfc1ff",
  func    = "#aeb8ff",
  type_   = "#ffecf3",
  str     = "#c8e3ff",
  num     = "#e0c2f9",
  keyword = "#e1d8ff",
  error   = "#bfa6fe",
  warn    = "#ffecf3",
  info    = "#aeb8ff",
  git_add = "#c8e3ff",
  git_mod = "#aeb8ff",
  git_del = "#bfa6fe",
}

return {
  normal = {
    a = { fg = c.bg,      bg = c.accent,  gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  insert = {
    a = { fg = c.bg,      bg = c.str,     gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  visual = {
    a = { fg = c.bg,      bg = c.num,     gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  replace = {
    a = { fg = c.bg,      bg = c.error,   gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  command = {
    a = { fg = c.bg,      bg = c.type_,   gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  terminal = {
    a = { fg = c.bg,      bg = c.func,    gui = "bold" },
    b = { fg = c.fg,      bg = c.bg2 },
    c = { fg = c.fg1,     bg = c.bg_dark },
  },
  inactive = {
    a = { fg = c.fg2,     bg = c.bg_dark },
    b = { fg = c.fg2,     bg = c.bg_dark },
    c = { fg = c.fg2,     bg = c.bg_dark },
  },
}
