-- nvSuckless
---- A simple and minimal neovim config files whithout gimmicks and bloat
-- by Alex. G. B.

-- tbh no idea but it requires for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- required for denols
vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

require("plugins") -- Import plugins

-- Config
---- Simple config related to vim
vim.wo.relativenumber = true -- Enable relative numbers
vim.wo.number = true -- Enable relative numbers
vim.opt.termguicolors = true -- Enable true color
vim.cmd("set mouse=") -- Disable right mouse

-- Config telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- File explorer
require("tree")

-- LSP
---- Config about autocompletion and setting up LSP servers
require("lsp") -- import plugins

require("drp")
