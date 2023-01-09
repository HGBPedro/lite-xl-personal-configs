-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local lintplus = require "plugins.lintplus"
local lspconfig = require "plugins.lsp.config"
local lsp = require "plugins.lsp"

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.monodark")

--------------------------- Key bindings -------------------------------------

-- key binding:
keymap.add { ["ctrl+q"] = "core:quit" }
keymap.add({ ["ctrl+,"] = "core:open-user-module"})
-- keymap.add({ ["ctrl+~"] = "git-blame:toggle" })

-- overwritten bindings
keymap.add({ ["ctrl+pageup"] = "root:switch-to-previous-tab" }, true)
keymap.add({ ["ctrl+pagedown"] = "root:switch-to-next-tab" }, true)

------------------------------- Fonts ----------------------------------------

-- customize fonts:
-- style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 14 * SCALE)
style.code_font = renderer.font.load(USERDIR .. "/fonts/Fira-Code-Regular.ttf", 11 * SCALE)
--
-- DATADIR is the location of the installed Lite XL Lua code, default color
-- schemes and fonts.
-- USERDIR is the location of the Lite XL configuration directory.
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full", bold=true, italic=true, underline=true, smoothing=true, strikethrough=true}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full
-- bold: true, false
-- italic: true, false
-- underline: true, false
-- smoothing: true, false
-- strikethrough: true, false

------------------------------ Plugins ----------------------------------------

-- enable or disable plugin loading setting config entries:
-- lintplus.load({"luacheck"})
lintplus.setup.lint_on_doc_load()
lintplus.setup.lint_on_doc_save()

-- Configs for LSP
lspconfig.tsserver.setup {
  file_patterns = { "%.jsx?$", "%.cjs$", "%.mjs$", "%.tsx?$", "%.ts$" },
  settings = {
    tsserver = {
      path = "~/.asdf/installs/nodejs/16.10.0/lib/node_modules/typescript/lib/typescript.js",
    }
  },
}

-- Configs for Git blame
config.plugins.gitblame = {
  -- Text color of blame information
  text_color = {200, 140, 220},
  -- Font size of blame information
  font_size = 13,
  -- The commit message will be truncated if it is longer than this variable's value
  max_commit_message_length = 50,
  -- If debug = true, then this plugin will output a log which can be accessed
  -- from "Core : Open Log" command
  debug = false,
}

-- enable plugins.trimwhitespace, otherwise it is disabled by default:
-- config.plugins.trimwhitespace = true
--
-- disable detectindent, otherwise it is enabled by default
config.plugins.detectindent = false

---------------------------- Miscellaneous -------------------------------------

-- modify list of files to ignore when indexing the project:
-- config.ignore_files = {
--   -- folders
--   "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
--   "^node_modules/", "^%.cache/", "^__pycache__/",
--   -- files
--   "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
--   "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
--   "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
--   "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
-- }

