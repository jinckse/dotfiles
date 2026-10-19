" ---------- PLUGINS ----------
set nocompatible              " be iMproved, required
filetype off                  " required

" Only load plugins if Vundle is installed (install.sh clones it), so Vim
" still starts without errors on a machine where it isn't.
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
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
endif
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
" Tabs: 4 columns, insert spaces (same as nvim/lua/options.lua)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Go requires real tabs (gofmt). Neovim's Go filetype plugin already does this,
" Vim 8.2's doesn't; Makefiles are handled by Vim's own filetype plugin.
augroup go_tabs
    autocmd!
    autocmd FileType go setlocal noexpandtab softtabstop=0 shiftwidth=0
augroup END

syntax on
colorscheme industry
