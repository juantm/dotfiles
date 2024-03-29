local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.foldcolumn = "3"
set.smartindent = true
set.incsearch = true
set.hlsearch = true
set.mouse = "a"

vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bp', ':bp<CR>')
vim.keymap.set('n', '<leader>bb', ':ls<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
vim.keymap.set('n', '<leader>fs', ':w<CR>')
vim.keymap.set('n', '<leader>qq', ':qa!<CR>')
vim.keymap.set('n', '<leader>tn', ':tabNext<CR>')
vim.keymap.set('n', '<leader>tp', ':tabPrevious<CR>')
vim.keymap.set('n', '<leader>td', ':tabclose<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>')
