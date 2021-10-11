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

" (polyglot) disable for specific languages; MUST be set before plugin loading
" - pascal: interferes with puppet *.pp files
let g:polyglot_disabled = ['pascal']

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'itchyny/lightline.vim' " lightweight statusline
  Plug 'rstacruz/vim-closer' " closes brackets on <Enter>
  Plug 'preservim/nerdtree' " file system explorer
  Plug 'justinmk/vim-sneak' " file navigation, jump anywhere with <s><*><*>
  Plug 'airblade/vim-gitgutter' " shows git diff markers
  Plug 'sheerun/vim-polyglot' " support syntax/indentation for many languages
  Plug 'Shougo/neosnippet.vim' " support for code snippets
call plug#end()

" (vimsneak) activate lables for even faster file navigation
let g:sneak#label = 1

" (neosnippets) configure code snippets directory
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.vim/snippets'

" (neosnippets) expanding and jump code snippets with <TAB>
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

" <C-f> to toggle file system explorer
nnoremap <C-f> :NERDTreeToggle<CR>

" <Space> turns off search matches highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" <t> jump to tag, <C-t> to jump back
nnoremap t <C-]>

" (commandline) <w><!><!> save files as sudo
cmap w!! w !sudo tee > /dev/null %
