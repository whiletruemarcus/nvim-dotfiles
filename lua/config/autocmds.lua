-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ~/.config/nvim/lua/config/commands.lua

-- Vi hämtar din modul som du skapade nyss
local my_keybinds = require("config.keybinds")

-- Vi skapar kommandot :Keybinds
-- När du kör detta i nvim, anropas funktionen show_keybinds
vim.api.nvim_create_user_command("Keybinds", my_keybinds.show_keybinds, {})
