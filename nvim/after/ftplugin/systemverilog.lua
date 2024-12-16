-- Do not pair single quotes or backticks
vim.keymap.set("i", "'", "'", { buffer = true })
vim.keymap.set("i", "`", "`", { buffer = true })

-- Fix tabstop
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
