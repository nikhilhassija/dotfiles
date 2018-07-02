set background=dark
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible
syntax on
filetype off

set t_Co=256

" too n00b :( "
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" start -- Vundle Setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" end -- Vundle Setup

" start -- Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dikiaap/minimalist'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-sleuth'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()
" end -- Plugins

" start -- NERDTree
map <C-n> :NERDTreeToggle<CR>
" end -- NERDTree

" start -- tagbar
nmap <F8> :TagbarToggle<CR>
" end -- tagbar

filetype plugin indent on

" Autosave folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

" Better backspace
set backspace=indent,eol,start
