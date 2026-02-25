vim.keymap.set('i', 'jj', '<Esc>')
vim.opt.clipboard = 'unnamedplus'
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('i', "'", "''<Left>")
vim.keymap.set('i', 'jk', '<C-x><C-o>', {})
vim.opt.guicursor = "a:hor20-blinkwait700-blinkon400-blinkoff400"
vim.opt.termguicolors = true


vim.api.nvim_set_hl(0, "@keyword",        { fg = "#d400ff" }) -- μωβ
vim.api.nvim_set_hl(0, "@function",       { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@string",         { fg = "#00ff41" })
vim.api.nvim_set_hl(0, "@type",           { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@variable",       { fg = "#ffffff" })local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#d400ff" })
vim.api.nvim_set_hl(0, "Type", { fg = "#006400" })
vim.api.nvim_set_hl(0, "String",         { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "Preproc",         { fg = "#c2185b" })
vim.api.nvim_set_hl(0, "cSpecial",         { fg = "#950606" })

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)




require("lazy").setup("plugins")
