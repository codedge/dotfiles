local g = vim.g
local o = vim.opt

-------------------------------------------------
-- General
-------------------------------------------------
o.syntax = "on"
o.mouse = "a"
o.clipboard = "unnamedplus"
o.swapfile = false
o.completeopt = "menuone,noinsert,noselect"
o.encoding = "UTF-8"
-------------------------------------------------
-- Neovim UI
-------------------------------------------------
o.number = true
o.relativenumber = false
o.colorcolumn = '80'
o.splitright = true
o.splitbelow = true
o.foldmethod = 'marker'
o.ignorecase = true
o.smartcase = true
o.linebreak = true
o.termguicolors = true
o.title = true
o.ruler = true
o.cursorline = true

-------------------------------------------------
-- Tabs, indent
-------------------------------------------------
o.autoindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"

-----------------------------
-- Memory, cpu
-----------------------------
o.hidden = true
o.ttimeoutlen = 0

-----------------------------
-- Startup
-----------------------------
o.shortmess:append "sI"

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
