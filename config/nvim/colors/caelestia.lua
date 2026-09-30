-- Caelestia colorscheme for Neovim
-- Generated from the Caelestia dotfiles color palette
vim.opt.termguicolors = true
vim.g.colors_name = "caelestia"

local c = {
  none    = "NONE",
  bg      = "#131317",
  bg_dark = "#0e0e11",
  bg1     = "#1f1f23",
  bg2     = "#2a292e",
  overlay = "#46464f",
  fg      = "#e5e1e7",
  fg1     = "#c7c5d1",
  fg2     = "#918f9a",
  accent  = "#bfc1ff",
  accent2 = "#aeb8ff",
  accent3 = "#b5c5ff",
  keyword = "#e1d8ff",
  str     = "#c8e3ff",
  str2    = "#cedaff",
  num     = "#e0c2f9",
  comment = "#918f9a",
  func    = "#aeb8ff",
  func2   = "#d2e0ff",
  prop    = "#d2e0ff",
  type_   = "#ffecf3",
  op      = "#b5c5ff",
  punct   = "#c7c5d1",
  preproc = "#d2e0ff",
  purple  = "#c794ff",
  warm    = "#ffecf3",
  rose    = "#bfa6fe",
  rose2   = "#c7b6ed",
  link    = "#7083d2",
  error   = "#bfa6fe",
  warn    = "#ffecf3",
  info    = "#aeb8ff",
  hint    = "#c7c5d1",
  git_add = "#c8e3ff",
  git_mod = "#aeb8ff",
  git_del = "#bfa6fe",

  -- Pre-blended semi-transparent colors (computed against bg #131317)
  sel_bg    = "#2c2c39",  -- accent ~15% (visual)
  sel_dim   = "#21212a",  -- accent ~8%  (visual NC / markup h1)
  ref_bg    = "#23232d",  -- accent ~9%  (lsp reference)
  ref_w_bg  = "#2e2e3b",  -- accent ~16% (lsp ref write)
  match_bg  = "#292934",  -- accent ~12% (search match)
  flash_bg  = "#333443",  -- accent ~19% (flash match)
  err_bg    = "#1e1c26",  -- error diagnostic vtext bg
  wrn_bg    = "#222125",  -- warn diagnostic vtext bg
  inf_bg    = "#1d1d26",  -- info diagnostic vtext bg
  hnt_bg    = "#1e1e23",  -- hint diagnostic vtext bg
  add_bg    = "#202228",  -- diff add bg
  mod_bg    = "#1e1f28",  -- diff mod bg
  del_bg    = "#1f1e27",  -- diff del bg
  add_bg_s  = "#1c1d22",  -- gitsigns add subtle
  mod_bg_s  = "#1a1b22",  -- gitsigns mod subtle
  del_bg_s  = "#1b1a22",  -- gitsigns del subtle
  h2_bg     = "#1d1d26",  -- markup h2 bg
  h3_bg     = "#1c1d22",  -- markup h3 bg
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor ────────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalNC",        { fg = c.fg1,     bg = c.bg })
hi("NormalFloat",     { fg = c.fg,      bg = c.bg2 })
hi("FloatBorder",     { fg = c.overlay, bg = c.bg2 })
hi("FloatTitle",      { fg = c.accent,  bg = c.bg2, bold = true })
hi("ColorColumn",     { bg = c.bg1 })
hi("Conceal",         { fg = c.fg2 })
hi("Cursor",          { fg = c.bg,      bg = c.fg })
hi("CursorIM",        { fg = c.bg,      bg = c.fg })
hi("CursorColumn",    { bg = c.bg2 })
hi("CursorLine",      { bg = c.bg1 })
hi("CursorLineNr",    { fg = c.fg,      bold = true })
hi("Directory",       { fg = c.accent })
hi("EndOfBuffer",     { fg = c.overlay })
hi("ErrorMsg",        { fg = c.error })
hi("Folded",          { fg = c.fg2,     bg = c.bg1 })
hi("FoldColumn",      { fg = c.fg2,     bg = c.bg })
hi("SignColumn",      { bg = c.bg })
hi("IncSearch",       { fg = c.bg,      bg = c.accent, bold = true })
hi("Substitute",      { fg = c.bg,      bg = c.warm, bold = true })
hi("LineNr",          { fg = c.overlay })
hi("LineNrAbove",     { fg = c.overlay })
hi("LineNrBelow",     { fg = c.overlay })
hi("MatchParen",      { fg = c.accent,  underline = true, bold = true })
hi("ModeMsg",         { fg = c.fg1 })
hi("MsgSeparator",    { fg = c.overlay })
hi("MoreMsg",         { fg = c.str })
hi("NonText",         { fg = c.overlay })
hi("Pmenu",           { fg = c.fg,      bg = c.bg2 })
hi("PmenuSel",        { fg = c.bg,      bg = c.accent, bold = true })
hi("PmenuSbar",       { bg = c.bg1 })
hi("PmenuThumb",      { bg = c.overlay })
hi("PmenuExtra",      { fg = c.fg2,     bg = c.bg2 })
hi("Question",        { fg = c.accent })
hi("QuickFixLine",    { bg = c.bg1 })
hi("Search",          { fg = c.bg,      bg = c.accent })
hi("SpecialKey",      { fg = c.fg2 })
hi("SpellBad",        { sp = c.error,   undercurl = true })
hi("SpellCap",        { sp = c.warn,    undercurl = true })
hi("SpellLocal",      { sp = c.info,    undercurl = true })
hi("SpellRare",       { sp = c.purple,  undercurl = true })
hi("StatusLine",      { fg = c.fg1,     bg = c.bg_dark })
hi("StatusLineNC",    { fg = c.fg2,     bg = c.bg_dark })
hi("TabLine",         { fg = c.fg2,     bg = c.bg_dark })
hi("TabLineFill",     { bg = c.bg_dark })
hi("TabLineSel",      { fg = c.fg,      bg = c.bg2, bold = true })
hi("Title",           { fg = c.func,    bold = true })
hi("Visual",          { bg = c.sel_bg })
hi("VisualNOS",       { bg = c.sel_dim })
hi("WarningMsg",      { fg = c.warn })
hi("Whitespace",      { fg = c.overlay })
hi("WildMenu",        { fg = c.bg,      bg = c.accent })
hi("WinBar",          { fg = c.fg1,     bg = c.bg })
hi("WinBarNC",        { fg = c.fg2,     bg = c.bg })
hi("WinSeparator",    { fg = c.overlay })
hi("WinSeparatorNC",  { fg = c.bg1 })

-- ─── Syntax ────────────────────────────────────────────────────────────────
hi("Comment",         { fg = c.comment, italic = true })
hi("Constant",        { fg = c.num })
hi("String",          { fg = c.str })
hi("Character",       { fg = c.str })
hi("Number",          { fg = c.num })
hi("Boolean",         { fg = c.num })
hi("Float",           { fg = c.num })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.func })
hi("Statement",       { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Label",           { fg = c.type_ })
hi("Operator",        { fg = c.op })
hi("Keyword",         { fg = c.keyword })
hi("Exception",       { fg = c.keyword })
hi("PreProc",         { fg = c.preproc })
hi("Include",         { fg = c.preproc })
hi("Define",          { fg = c.preproc })
hi("Macro",           { fg = c.preproc })
hi("PreCondit",       { fg = c.preproc })
hi("Type",            { fg = c.type_ })
hi("StorageClass",    { fg = c.keyword })
hi("Structure",       { fg = c.type_ })
hi("Typedef",         { fg = c.type_ })
hi("Special",         { fg = c.type_ })
hi("SpecialChar",     { fg = c.keyword })
hi("Tag",             { fg = c.type_ })
hi("Delimiter",       { fg = c.punct })
hi("SpecialComment",  { fg = c.comment, italic = true })
hi("Debug",           { fg = c.rose })
hi("Underlined",      { fg = c.func, underline = true })
hi("Ignore",          { fg = c.overlay })
hi("Error",           { fg = c.error })
hi("Todo",            { fg = c.bg, bg = c.accent, bold = true })

-- ─── Treesitter ────────────────────────────────────────────────────────────
hi("@variable",                     { fg = c.fg })
hi("@variable.builtin",             { fg = c.fg, italic = true })
hi("@variable.parameter",           { fg = c.prop, italic = true })
hi("@variable.parameter.builtin",   { fg = c.prop, italic = true })
hi("@variable.member",              { fg = c.prop })
hi("@constant",                     { fg = c.num })
hi("@constant.builtin",             { fg = c.num })
hi("@constant.macro",               { fg = c.num })
hi("@module",                       { fg = c.fg })
hi("@module.builtin",               { fg = c.fg })
hi("@label",                        { fg = c.type_ })
hi("@string",                       { fg = c.str })
hi("@string.documentation",         { fg = c.comment, italic = true })
hi("@string.regexp",                { fg = c.str2 })
hi("@string.escape",                { fg = c.keyword })
hi("@string.special",               { fg = c.str })
hi("@string.special.symbol",        { fg = c.prop })
hi("@string.special.url",           { fg = c.func, underline = true })
hi("@character",                    { fg = c.str })
hi("@character.special",            { fg = c.keyword })
hi("@boolean",                      { fg = c.num })
hi("@number",                       { fg = c.num })
hi("@number.float",                 { fg = c.num })
hi("@type",                         { fg = c.type_ })
hi("@type.builtin",                 { fg = c.fg })
hi("@type.definition",              { fg = c.type_ })
hi("@attribute",                    { fg = c.type_, italic = true })
hi("@attribute.builtin",            { fg = c.type_ })
hi("@property",                     { fg = c.prop })
hi("@function",                     { fg = c.func })
hi("@function.builtin",             { fg = c.func2 })
hi("@function.call",                { fg = c.func })
hi("@function.macro",               { fg = c.func2 })
hi("@function.method",              { fg = c.func })
hi("@function.method.call",         { fg = c.func })
hi("@constructor",                  { fg = c.type_ })
hi("@operator",                     { fg = c.op })
hi("@keyword",                      { fg = c.keyword })
hi("@keyword.coroutine",            { fg = c.keyword })
hi("@keyword.function",             { fg = c.keyword })
hi("@keyword.operator",             { fg = c.op })
hi("@keyword.import",               { fg = c.preproc })
hi("@keyword.storage",              { fg = c.keyword })
hi("@keyword.repeat",               { fg = c.keyword })
hi("@keyword.return",               { fg = c.keyword })
hi("@keyword.debug",                { fg = c.rose })
hi("@keyword.exception",            { fg = c.keyword })
hi("@keyword.conditional",          { fg = c.keyword })
hi("@keyword.conditional.ternary",  { fg = c.op })
hi("@keyword.directive",            { fg = c.preproc })
hi("@keyword.directive.define",     { fg = c.preproc })
hi("@punctuation.delimiter",        { fg = c.punct })
hi("@punctuation.bracket",          { fg = c.punct })
hi("@punctuation.special",          { fg = c.op })
hi("@comment",                      { fg = c.comment, italic = true })
hi("@comment.documentation",        { fg = c.comment, italic = true })
hi("@comment.error",                { fg = c.error, bold = true })
hi("@comment.warning",              { fg = c.warn, bold = true })
hi("@comment.todo",                 { fg = c.bg, bg = c.accent, bold = true })
hi("@comment.note",                 { fg = c.info, bold = true })
hi("@markup.strong",                { fg = c.rose, bold = true })
hi("@markup.italic",                { fg = c.rose, italic = true })
hi("@markup.strikethrough",         { fg = c.fg2, strikethrough = true })
hi("@markup.underline",             { underline = true })
hi("@markup.heading",               { fg = c.func, bold = true })
hi("@markup.heading.1",             { fg = c.accent, bold = true })
hi("@markup.heading.2",             { fg = c.func, bold = true })
hi("@markup.heading.3",             { fg = c.prop, bold = true })
hi("@markup.heading.4",             { fg = c.str, bold = true })
hi("@markup.heading.5",             { fg = c.num, bold = true })
hi("@markup.heading.6",             { fg = c.type_, bold = true })
hi("@markup.quote",                 { fg = c.fg1, italic = true })
hi("@markup.math",                  { fg = c.str })
hi("@markup.link",                  { fg = c.func, underline = true })
hi("@markup.link.label",            { fg = c.func })
hi("@markup.link.url",              { fg = c.func, underline = true })
hi("@markup.raw",                   { fg = c.str })
hi("@markup.raw.block",             { fg = c.str })
hi("@markup.list",                  { fg = c.prop })
hi("@markup.list.checked",          { fg = c.str })
hi("@markup.list.unchecked",        { fg = c.fg2 })
hi("@diff.plus",                    { fg = c.git_add })
hi("@diff.minus",                   { fg = c.git_del })
hi("@diff.delta",                   { fg = c.git_mod })
hi("@tag",                          { fg = c.type_ })
hi("@tag.builtin",                  { fg = c.type_ })
hi("@tag.attribute",                { fg = c.prop, italic = true })
hi("@tag.delimiter",                { fg = c.punct })

-- ─── LSP ───────────────────────────────────────────────────────────────────
hi("LspReferenceText",              { bg = c.ref_bg })
hi("LspReferenceRead",              { bg = c.ref_bg })
hi("LspReferenceWrite",             { bg = c.ref_w_bg, underline = true })
hi("LspSignatureActiveParameter",   { fg = c.accent, bold = true })
hi("LspInlayHint",                  { fg = c.fg2, bg = c.bg1, italic = true })
hi("LspCodeLens",                   { fg = c.fg2, italic = true })
hi("LspCodeLensSeparator",          { fg = c.overlay })

-- ─── Diagnostics ───────────────────────────────────────────────────────────
hi("DiagnosticError",               { fg = c.error })
hi("DiagnosticWarn",                { fg = c.warn })
hi("DiagnosticInfo",                { fg = c.info })
hi("DiagnosticHint",                { fg = c.hint })
hi("DiagnosticOk",                  { fg = c.str })
hi("DiagnosticUnnecessary",         { fg = c.fg2, italic = true })
hi("DiagnosticDeprecated",          { fg = c.fg2, strikethrough = true })
hi("DiagnosticVirtualTextError",    { fg = c.error, bg = c.err_bg, italic = true })
hi("DiagnosticVirtualTextWarn",     { fg = c.warn,  bg = c.wrn_bg, italic = true })
hi("DiagnosticVirtualTextInfo",     { fg = c.info,  bg = c.inf_bg, italic = true })
hi("DiagnosticVirtualTextHint",     { fg = c.hint,  bg = c.hnt_bg, italic = true })
hi("DiagnosticUnderlineError",      { sp = c.error, undercurl = true })
hi("DiagnosticUnderlineWarn",       { sp = c.warn,  undercurl = true })
hi("DiagnosticUnderlineInfo",       { sp = c.info,  undercurl = true })
hi("DiagnosticUnderlineHint",       { sp = c.hint,  undercurl = true })
hi("DiagnosticSignError",           { fg = c.error })
hi("DiagnosticSignWarn",            { fg = c.warn })
hi("DiagnosticSignInfo",            { fg = c.info })
hi("DiagnosticSignHint",            { fg = c.hint })
hi("DiagnosticFloatingError",       { fg = c.error })
hi("DiagnosticFloatingWarn",        { fg = c.warn })
hi("DiagnosticFloatingInfo",        { fg = c.info })
hi("DiagnosticFloatingHint",        { fg = c.hint })

-- ─── Diff ──────────────────────────────────────────────────────────────────
hi("DiffAdd",     { fg = c.git_add, bg = c.add_bg })
hi("DiffChange",  { fg = c.git_mod, bg = c.mod_bg })
hi("DiffDelete",  { fg = c.git_del, bg = c.del_bg })
hi("DiffText",    { fg = c.git_mod, bg = c.mod_bg, bold = true })
hi("diffAdded",   { fg = c.git_add })
hi("diffRemoved", { fg = c.git_del })
hi("diffChanged", { fg = c.git_mod })
hi("diffFile",    { fg = c.func, bold = true })
hi("diffNewFile", { fg = c.str })
hi("diffLine",    { fg = c.accent })

-- ─── Terminal ──────────────────────────────────────────────────────────────
vim.g.terminal_color_0  = "#131317"
vim.g.terminal_color_1  = "#bfa6fe"
vim.g.terminal_color_2  = "#c8e3ff"
vim.g.terminal_color_3  = "#ffecf3"
vim.g.terminal_color_4  = "#aeb8ff"
vim.g.terminal_color_5  = "#c794ff"
vim.g.terminal_color_6  = "#60adff"
vim.g.terminal_color_7  = "#e5e1e7"
vim.g.terminal_color_8  = "#c7c5d1"
vim.g.terminal_color_9  = "#c7b6ed"
vim.g.terminal_color_10 = "#d2e0ff"
vim.g.terminal_color_11 = "#e0c2f9"
vim.g.terminal_color_12 = "#b5c5ff"
vim.g.terminal_color_13 = "#e0c2f9"
vim.g.terminal_color_14 = "#7083d2"
vim.g.terminal_color_15 = "#e5e1e7"

-- ─── Plugins ───────────────────────────────────────────────────────────────

-- Telescope
hi("TelescopeBorder",         { fg = c.overlay,  bg = c.bg })
hi("TelescopeNormal",         { fg = c.fg,        bg = c.bg })
hi("TelescopePreviewBorder",  { fg = c.overlay,   bg = c.bg_dark })
hi("TelescopePreviewNormal",  { fg = c.fg1,       bg = c.bg_dark })
hi("TelescopePreviewTitle",   { fg = c.bg,        bg = c.func, bold = true })
hi("TelescopePromptBorder",   { fg = c.bg2,       bg = c.bg2 })
hi("TelescopePromptNormal",   { fg = c.fg,        bg = c.bg2 })
hi("TelescopePromptPrefix",   { fg = c.accent,    bg = c.bg2 })
hi("TelescopePromptTitle",    { fg = c.bg,        bg = c.accent, bold = true })
hi("TelescopeResultsBorder",  { fg = c.bg,        bg = c.bg })
hi("TelescopeResultsNormal",  { fg = c.fg,        bg = c.bg })
hi("TelescopeResultsTitle",   { fg = c.bg,        bg = c.func, bold = true })
hi("TelescopeSelection",      { fg = c.fg,        bg = c.ref_bg })
hi("TelescopeSelectionCaret", { fg = c.accent,    bg = c.ref_bg })
hi("TelescopeMatching",       { fg = c.accent,    bold = true })

-- nvim-cmp
hi("CmpDocumentation",          { fg = c.fg,  bg = c.bg2 })
hi("CmpDocumentationBorder",    { fg = c.overlay, bg = c.bg2 })
hi("CmpGhostText",              { fg = c.fg2, italic = true })
hi("CmpItemAbbr",               { fg = c.fg1 })
hi("CmpItemAbbrDeprecated",     { fg = c.fg2, strikethrough = true })
hi("CmpItemAbbrMatch",          { fg = c.accent, bold = true })
hi("CmpItemAbbrMatchFuzzy",     { fg = c.accent })
hi("CmpItemKindDefault",        { fg = c.fg2 })
hi("CmpItemMenu",               { fg = c.fg2, italic = true })
hi("CmpItemKindFunction",       { fg = c.func })
hi("CmpItemKindMethod",         { fg = c.func })
hi("CmpItemKindConstructor",    { fg = c.type_ })
hi("CmpItemKindClass",          { fg = c.type_ })
hi("CmpItemKindInterface",      { fg = c.type_ })
hi("CmpItemKindStruct",         { fg = c.type_ })
hi("CmpItemKindEnum",           { fg = c.type_ })
hi("CmpItemKindEnumMember",     { fg = c.num })
hi("CmpItemKindKeyword",        { fg = c.keyword })
hi("CmpItemKindSnippet",        { fg = c.warm })
hi("CmpItemKindText",           { fg = c.fg1 })
hi("CmpItemKindVariable",       { fg = c.fg })
hi("CmpItemKindField",          { fg = c.prop })
hi("CmpItemKindProperty",       { fg = c.prop })
hi("CmpItemKindModule",         { fg = c.preproc })
hi("CmpItemKindFile",           { fg = c.fg1 })
hi("CmpItemKindFolder",         { fg = c.accent })
hi("CmpItemKindColor",          { fg = c.purple })
hi("CmpItemKindReference",      { fg = c.fg1 })
hi("CmpItemKindValue",          { fg = c.num })
hi("CmpItemKindUnit",           { fg = c.num })
hi("CmpItemKindOperator",       { fg = c.op })
hi("CmpItemKindTypeParameter",  { fg = c.type_ })
hi("CmpItemKindEvent",          { fg = c.warm })
hi("CmpItemKindCopilot",        { fg = c.str })

-- GitSigns
hi("GitSignsAdd",         { fg = c.git_add })
hi("GitSignsChange",      { fg = c.git_mod })
hi("GitSignsDelete",      { fg = c.git_del })
hi("GitSignsTopdelete",   { fg = c.git_del })
hi("GitSignsChangedelete",{ fg = c.git_mod })
hi("GitSignsUntracked",   { fg = c.fg2 })
hi("GitSignsAddNr",       { fg = c.git_add })
hi("GitSignsChangeNr",    { fg = c.git_mod })
hi("GitSignsDeleteNr",    { fg = c.git_del })
hi("GitSignsAddLn",       { bg = c.add_bg_s })
hi("GitSignsChangeLn",    { bg = c.mod_bg_s })
hi("GitSignsDeleteLn",    { bg = c.del_bg_s })

-- Noice
hi("NoiceCmdline",            { fg = c.fg,      bg = c.bg2 })
hi("NoiceCmdlineIcon",        { fg = c.accent,  bg = c.bg2 })
hi("NoiceCmdlineIconSearch",  { fg = c.warm,    bg = c.bg2 })
hi("NoiceCmdlinePopup",       { fg = c.fg,      bg = c.bg2 })
hi("NoiceCmdlinePopupBorder", { fg = c.accent,  bg = c.bg2 })
hi("NoiceCmdlinePopupTitle",  { fg = c.accent })
hi("NoiceLspProgressClient",  { fg = c.accent })
hi("NoiceLspProgressSpinner", { fg = c.accent })
hi("NoiceMini",               { fg = c.fg,      bg = c.bg1 })
hi("NoicePopup",              { fg = c.fg,      bg = c.bg2 })
hi("NoicePopupBorder",        { fg = c.overlay, bg = c.bg2 })
hi("NoiceScrollbar",          { bg = c.bg1 })
hi("NoiceScrollbarThumb",     { bg = c.overlay })
hi("NoiceConfirmBorder",      { fg = c.accent })

-- Flash
hi("FlashBackdrop",  { fg = c.fg2 })
hi("FlashLabel",     { fg = c.bg,     bg = c.accent, bold = true })
hi("FlashMatch",     { fg = c.accent, bg = c.flash_bg })
hi("FlashCurrent",   { fg = c.bg,     bg = c.func, bold = true })
hi("FlashPrompt",    { fg = c.fg,     bg = c.bg2 })

-- which-key
hi("WhichKey",          { fg = c.accent })
hi("WhichKeyGroup",     { fg = c.func })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeyBorder",    { fg = c.overlay, bg = c.bg2 })
hi("WhichKeyNormal",    { fg = c.fg,      bg = c.bg2 })
hi("WhichKeySeparator", { fg = c.fg2 })
hi("WhichKeyValue",     { fg = c.fg2 })

-- Snacks
hi("SnacksDashboardHeader",    { fg = c.accent, bold = true })
hi("SnacksDashboardTitle",     { fg = c.fg,     bold = true })
hi("SnacksDashboardSubTitle",  { fg = c.fg1 })
hi("SnacksDashboardDesc",      { fg = c.fg1 })
hi("SnacksDashboardKey",       { fg = c.accent, bold = true })
hi("SnacksDashboardIcon",      { fg = c.func })
hi("SnacksDashboardFile",      { fg = c.fg1 })
hi("SnacksDashboardDir",       { fg = c.accent })
hi("SnacksDashboardFooter",    { fg = c.fg2,    italic = true })
hi("SnacksDashboardSpecial",   { fg = c.accent })
hi("SnacksNotifier",           { fg = c.fg,     bg = c.bg2 })
hi("SnacksNotifierBorder",     { fg = c.overlay, bg = c.bg2 })
hi("SnacksNotifierIconError",  { fg = c.error })
hi("SnacksNotifierIconWarn",   { fg = c.warn })
hi("SnacksNotifierIconInfo",   { fg = c.info })
hi("SnacksNotifierIconDebug",  { fg = c.hint })
hi("SnacksNotifierTitleError", { fg = c.error,  bold = true })
hi("SnacksNotifierTitleWarn",  { fg = c.warn,   bold = true })
hi("SnacksNotifierTitleInfo",  { fg = c.info,   bold = true })
hi("SnacksNotifierTitleDebug", { fg = c.hint,   bold = true })
hi("SnacksPickerBorder",       { fg = c.overlay, bg = c.bg })
hi("SnacksPickerNormal",       { fg = c.fg,      bg = c.bg })
hi("SnacksPickerInputBorder",  { fg = c.accent,  bg = c.bg2 })
hi("SnacksPickerInputNormal",  { fg = c.fg,      bg = c.bg2 })
hi("SnacksPickerMatch",        { fg = c.accent,  bold = true })
hi("SnacksIndent",             { fg = c.overlay })
hi("SnacksIndentScope",        { fg = c.accent })
hi("SnacksPickerTitle",        { fg = c.bg,      bg = c.accent, bold = true })

-- Lazy.nvim
hi("LazyButton",         { bg = c.bg2 })
hi("LazyButtonActive",   { bg = c.ref_bg, bold = true })
hi("LazyCommit",         { fg = c.str })
hi("LazyCommitIssue",    { fg = c.rose })
hi("LazyCommitScope",    { fg = c.fg1,    italic = true })
hi("LazyCommitType",     { fg = c.func,   bold = true })
hi("LazyDimmed",         { fg = c.fg2 })
hi("LazyDir",            { fg = c.accent })
hi("LazyH1",             { fg = c.bg,     bg = c.accent, bold = true })
hi("LazyH2",             { fg = c.accent, bold = true })
hi("LazyLocal",          { fg = c.purple })
hi("LazyNormal",         { bg = c.bg })
hi("LazyProgressDone",   { fg = c.str,    bold = true })
hi("LazyProgressTodo",   { fg = c.fg2,    bold = true })
hi("LazyProp",           { fg = c.func })
hi("LazySpecial",        { fg = c.accent })
hi("LazyTaskError",      { fg = c.error })
hi("LazyTaskOutput",     { fg = c.fg })
hi("LazyUrl",            { fg = c.func,   underline = true })
hi("LazyValue",          { fg = c.str })

-- Trouble
hi("TroubleText",     { fg = c.fg1 })
hi("TroubleCount",    { fg = c.accent, bg = c.bg2 })
hi("TroubleIndent",   { fg = c.overlay })
hi("TroubleLocation", { fg = c.fg2 })
hi("TroubleSignError",{ fg = c.error })
hi("TroubleSignWarn", { fg = c.warn })
hi("TroubleSignInfo", { fg = c.info })
hi("TroubleSignHint", { fg = c.hint })
hi("TroubleNormal",   { fg = c.fg,     bg = c.bg })

-- mini.indentscope
hi("MiniIndentscopeSymbol",    { fg = c.accent })
hi("MiniIndentscopeSymbolOff", { fg = c.overlay })

-- mini.animate
hi("MiniAnimateCursor", { reverse = true })

-- mini.diff
hi("MiniDiffSignAdd",    { fg = c.git_add })
hi("MiniDiffSignChange", { fg = c.git_mod })
hi("MiniDiffSignDelete", { fg = c.git_del })
hi("MiniDiffOverAdd",    { bg = c.add_bg })
hi("MiniDiffOverChange", { bg = c.mod_bg })
hi("MiniDiffOverDelete", { bg = c.del_bg })

-- Render markdown
hi("RenderMarkdownH1Bg",      { bg = c.sel_dim })
hi("RenderMarkdownH2Bg",      { bg = c.h2_bg })
hi("RenderMarkdownH3Bg",      { bg = c.h3_bg })
hi("RenderMarkdownH1",        { fg = c.accent, bold = true })
hi("RenderMarkdownH2",        { fg = c.func,   bold = true })
hi("RenderMarkdownH3",        { fg = c.prop,   bold = true })
hi("RenderMarkdownCode",      { bg = c.bg1 })
hi("RenderMarkdownCodeInline",{ fg = c.str,    bg = c.bg1 })

-- neo-tree
hi("NeoTreeNormal",         { fg = c.fg,   bg = c.bg_dark })
hi("NeoTreeNormalNC",       { fg = c.fg1,  bg = c.bg_dark })
hi("NeoTreeDirectoryIcon",  { fg = c.accent })
hi("NeoTreeDirectoryName",  { fg = c.fg })
hi("NeoTreeFileName",       { fg = c.fg1 })
hi("NeoTreeGitAdded",       { fg = c.git_add })
hi("NeoTreeGitModified",    { fg = c.git_mod })
hi("NeoTreeGitDeleted",     { fg = c.git_del })
hi("NeoTreeGitUntracked",   { fg = c.fg2 })
hi("NeoTreeIndentMarker",   { fg = c.overlay })
hi("NeoTreeWinSeparator",   { fg = c.bg_dark, bg = c.bg_dark })
hi("NeoTreeEndOfBuffer",    { fg = c.bg_dark, bg = c.bg_dark })
hi("NeoTreeRootName",       { fg = c.accent,  bold = true })
hi("NeoTreeTabActive",      { fg = c.fg,      bg = c.bg2, bold = true })
hi("NeoTreeTabInactive",    { fg = c.fg2,     bg = c.bg_dark })
hi("NeoTreeTabSeparatorActive",  { fg = c.bg2,     bg = c.bg2 })
hi("NeoTreeTabSeparatorInactive",{ fg = c.bg_dark, bg = c.bg_dark })

-- todo-comments
hi("TodoBgTODO",  { fg = c.bg, bg = c.accent, bold = true })
hi("TodoBgFIX",   { fg = c.bg, bg = c.error,  bold = true })
hi("TodoBgHACK",  { fg = c.bg, bg = c.warn,   bold = true })
hi("TodoBgWARN",  { fg = c.bg, bg = c.warn,   bold = true })
hi("TodoBgPERF",  { fg = c.bg, bg = c.func,   bold = true })
hi("TodoBgNOTE",  { fg = c.bg, bg = c.str,    bold = true })
hi("TodoBgTEST",  { fg = c.bg, bg = c.purple, bold = true })
hi("TodoFgTODO",  { fg = c.accent })
hi("TodoFgFIX",   { fg = c.error })
hi("TodoFgHACK",  { fg = c.warn })
hi("TodoFgWARN",  { fg = c.warn })
hi("TodoFgPERF",  { fg = c.func })
hi("TodoFgNOTE",  { fg = c.str })
hi("TodoFgTEST",  { fg = c.purple })
