" Configure general options {{{1
set encoding=utf-8
scriptencoding utf-8
set fileencodings+=cp932,enc-jp

if &compatible
    set nocompatible
endif

set ambiwidth=double
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set completeopt=menuone,noinsert
set cursorline
set diffopt+=vertical,algorithm:histogram,indent-heuristic
set display=lastline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=0
set modeline
set nonumber
set noshowcmd
set omnifunc=syntaxcomplete#Complete
set pumheight=10
set ruler
set shiftwidth=4
set signcolumn=no
set smartcase
set softtabstop=4
set splitbelow
set tabstop=4
set title
set wildmode=longest,list

if has('win32')
  set viminfo+=n~/vimfiles/viminfo
  set directory=~/vimfiles/swap
  call mkdir(&directory, 'p')

  let s:pwsh = 'pwsh'
  let s:powershell = 'powershell'
  if executable(s:pwsh)
    let &shell = s:pwsh
  elseif executable(s:powershell)
    let &shell = s:powershell
  endif
elseif has('unix')
  set viminfo+=n~/.vim/viminfo
  set directory=~/.vim/swap
  call mkdir(&directory, 'p')

  let s:bash = '/bin/bash'
  if executable(s:bash)
    let &shell = s:bash
  endif
endif

if has('termguicolors')
    set termguicolors
endif

syntax enable

filetype plugin indent on

augroup VimrcFileTypeIndent
    autocmd!
    autocmd FileType c setlocal sts=4 sw=4 ts=4
    autocmd FileType json setlocal sts=2 sw=2 ts=2
    autocmd FileType sshconfig setlocal sts=2 sw=2 ts=2
    autocmd FileType yaml setlocal sts=2 sw=2 ts=2
augroup END

augroup VimrcFormatOptions
    autocmd!
    autocmd FileType * setlocal formatoptions-=ro indentkeys-=0#
augroup END

let g:mapleader = "\<Space>"

let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" Define utils {{{1
command! CdHere :cd %:h
command! Reload :source $MYVIMRC
command! Vimrc :edit $MYVIMRC

" plugins {{{1
call plug#begin()

Plug 'andymass/vim-matchup'
Plug 'cohama/lexima.vim'
Plug 'godlygeek/tabular'
Plug 'kana/vim-smartword'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/vim-protocol'
Plug 'machakann/vim-sandwich'
Plug 'moll/vim-bbye'
Plug 'nordtheme/vim'
Plug 'rhysd/clever-f.vim'
Plug 'simeji/winresizer'
Plug 'svermeulen/vim-subversive'
Plug 'thinca/vim-qfreplace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'

call plug#end()

" kana/vim-smartword {{{2
map w <Plug>(smartword-w)
map b <Plug>(smartword-b)
map e <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

" lambdalisue/fern.vim {{{2
nnoremap <Leader>f <Cmd>Fern . -drawer -toggle -stay<CR>

" nordtheme/vim {{{2
colorscheme nord

" simeji/winresizer {{{2
let g:winresizer_start_key = '<Leader>e'

" svermeulen/vim-subversive {{{2
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" vim:fdm=marker
