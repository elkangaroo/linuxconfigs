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
let g:polyglot_disabled = [ 'pascal' ]

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'itchyny/lightline.vim' " lightweight statusline
  Plug 'rstacruz/vim-closer' " closes brackets on <Enter>
  Plug 'preservim/nerdtree' " file system explorer
  Plug 'justinmk/vim-sneak' " file navigation, jump anywhere with <s><*><*>
  Plug 'tpope/vim-fugitive' " wrapper for git
  Plug 'airblade/vim-gitgutter' " shows git diff markers
  Plug 'sheerun/vim-polyglot' " support syntax/indentation for many languages
  Plug 'Shougo/neosnippet.vim' " support for code snippets
  Plug 'joshdick/onedark.vim' " color scheme (supporting 16/256/true-color)
  Plug 'will133/vim-dirdiff' " recursive directory diff
call plug#end()

" (lightline) use onedark color scheme
let g:lightline = { 'colorscheme': 'onedark' }

" (vimsneak) activate lables for even faster file navigation
let g:sneak#label = 1

" (neosnippets) only use snippets from honza/vim-snippets (snipmate format); disable bundled snippets
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory = '~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
" (neosnippets) expanding and jump code snippets with <TAB>
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" (nerdtree) show hidden (.) files by default
let NERDTreeShowHidden = 1
" (nerdtree) mirror existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" enable folding for markdown files
let g:markdown_folding = 1

" => General settings
"""""""""""""""""""""""

set nocompatible

set autoindent " auto indents next new line
set clipboard=unnamed
set foldlevel=1 " always unfold top-level
set hlsearch " highlight all search matches
set ignorecase " case-insensitive search
set incsearch " increment search
set laststatus=2 " always show the statusline
set mouse= " disable mouse support
set noshowmode " hide current mode in statusline (replaced by lightline.vim)
set number " show line numbers
set scrolloff=3 " always show #n lines above/below current line
set shiftwidth=2 " #n columns for auto-indenting
set showmatch " highlight matching braces
set smartcase " uppercase causes case-sensitive search
set tabstop=2 " tabs appear as #n columns
set title " show filename in console title

if has('termguicolors')
  set termguicolors
endif

if &term == "screen"
  set t_Co=256
endif

syntax on

filetype plugin indent on

colorscheme onedark
" colorscheme dante
" colorscheme oceandeep
" colorscheme pablo

" => Key mappings
"""""""""""""""""""

" <C-f> to open file explorer with current file selected (<q> to close)
nnoremap <C-f> :NERDTreeFind<CR>

" <Space> turns off search matches highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" <t> jump to tag, <C-t> to jump back
nnoremap t <C-]>

" (commandline) <w><!><!> save files as sudo
cmap w!! w !sudo tee > /dev/null %
