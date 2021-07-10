" => Plugins
""""""""""""""

let url_vimplug = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Install vim-plug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . url_vimplug 
endif

" Run PlugInstall if missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'itchyny/lightline.vim' " lightweight statusline
  Plug 'lumiliet/vim-twig', { 'for': 'twig' } " twig syntax support
call plug#end()

" => General settings
"""""""""""""""""""""""

set nocompatible

set autoindent " auto indents next new line
set clipboard=unnamed
set hlsearch " highlight all search matches
set ignorecase " case-insensitive search
set incsearch " increment search
set laststatus=2 " always show the statusline
set noshowmode " hide current mode in statusline (replaced by lightline.vim)
set number " show line numbers
set scrolloff=3 " always show #n lines above/below current line
set shiftwidth=2 " #n columns for auto-indenting
set showmatch " highlight matching braces
set smartcase " uppercase causes case-sensitive search
set tabstop=2 " tabs appear as #n columns
set title " show filename in console title

syntax on

filetype plugin indent on

colorscheme dante
" colorscheme oceandeep
" colorscheme pablo

" => Key mappings
"""""""""""""""""""

" <Space> turns off search matches highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" <t> jump to tag, <C-t> to jump back
nnoremap t <C-]>

" (commandline) <w><!><!> save files as sudo
cmap w!! w !sudo tee > /dev/null %
