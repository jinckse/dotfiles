" ---------- PLUGINS ----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" Git commands (:Git, :Gdiffsplit, :Git blame)
Plugin 'tpope/vim-fugitive'
" HTML shorthand expansion; the vim script lives in the repo's vim/ subdirectory
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" File templates for new files
Plugin 'tibabit/vim-templates'

" Autoformatting
Plugin 'Chiel92/vim-autoformat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------- BASICS ----------
set nowrap
set nu
set tabstop=4
set shiftwidth=4
syntax on
colorscheme industry
