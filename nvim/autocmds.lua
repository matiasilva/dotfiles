-- Highlight trailing whitespace in bold red
vim.cmd([[
  autocmd BufReadPre * hi TrailingWhitespace guibg=red|match TrailingWhitespace /\s\+$/
  autocmd BufWrite * hi TrailingWhitespace guibg=red|match TrailingWhitespace /\s\+$/
]])

-- Set all systemverilog/verilog files to systemverilog and fix tabstop/shiftwidth
vim.cmd([[
  autocmd BufNewFile,BufRead *.sv,*.svh,*.v,*.vh set filetype=systemverilog
  autocmd Filetype systemverilog set tabstop=3 shiftwidth=3
]])
