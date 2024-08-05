" Install Vim-Plug if it doesnt already exist "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'davidhalter/jedi-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'drgarcia1986/python-compilers.vim'
call plug#end()

" python
augroup python
    au!
    autocmd FileType python compiler flake8
    autocmd BufWritePost *.py silent make! <afile> | silent redraw!
	autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" line numbers"
set number

" miscellaneous"
set nocompatible

" syntax highlighting "
syntax on

" good terminal colors"
set termguicolors

" theme "
let g:gruvbox_italic=1
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

" fix backspace defaults "
set backspace=indent,eol,start

" highlight search items "
set hlsearch

" mouse support
set mouse=a

" tabs "
set tabstop=4
set shiftwidth=4
set expandtab

" Put these in an autocmd group, so that you can revert them with:
" ":autocmd! vimStartup"
augroup vimStartup
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim), for a commit or rebase message
    " (likely a different one than last time), and when using xxd(1) to filter
    " and edit binary files (it transforms input files back and forth, causing
    " them to have dual nature, so to speak)
    autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase'], &filetype) == -1
    \ |   execute "normal! g`\""
    \ | endif
augroup END

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>g :Commits<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
command! -bang -nargs=* Rg
    \ call fzf#vim#grep("rg -u --column --line-number --no-heading --color=always --smart-case -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)
noremap <leader>f :30vs .<CR>
