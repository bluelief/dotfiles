" General
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set paste

set title

" Encoding
set encoding=utf-8
scriptencoding utf-8

" Search
set noignorecase
set wrapscan

filetype on
filetype plugin indent on

" File Types
augroup fileTypeIndent
  autocmd!
  autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rs setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.c setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.cc setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.h setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile * nested if @% !~ '\.' && getline(1) == '^#!/bin/bash.*' | set filetype=bash | endif
  autocmd BufRead,BufNewFile * nested if @% == '\.' | set filetype=bash | endif
  autocmd BufRead,BufNewFile * nested if @% !~ '\.' && getline(1) == '^#!.*python.*' | set filetype=python | endif
  autocmd BufRead,BufNewFile * nested if @% !~ '\.' && getline(1) == '^#!.*ruby.*' | set filetype=ruby | endif
augroup END


" paste config
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif


" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" night-owl/vim Scheme {{{
syntax enable
colorscheme night-owl
" }}}

" vim-airline/vim-airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'wombat'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" }}}
