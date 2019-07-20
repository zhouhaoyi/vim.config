" File              : vimrc
" Author            : haoyi <haoyi@buaa.edu.cn>
" Date              : 20.07.2019
" Last Modified Date: 20.07.2019
" Last Modified By  : haoyi <haoyi@buaa.edu.cn>

" ===
" === Auto load for first time uses
" ===
if has('nvim')
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif



let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set scrolloff=4

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Basic map
noremap <C-C> <Esc>
noremap n nzz
noremap N Nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap K 5k
noremap J 5j
" N key: go to the start of the line
noremap <C-h> 0
" I key: go to the end of the line
noremap <C-l> $

" Insert mode: map
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-b> <Backspace>
imap <C-d> <Delete>
imap <C-o> <Esc>o

" Control the split window
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Control the Tabs
map tk :tabe<CR>
map tl :-tabnext<CR>
map th :+tabnext<CR>

" For quick save and reload
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" Press ` to change case (instead of ~)
map ` ~


call plug#begin('~/.vim/plugged')
" Std plugin
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
if has('nvim')
  " Install pynvim in python first
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
endif

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Auto Complete
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'pbondoer/vim-42header'
Plug 'alpertuna/vim-header'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug']  }
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'


call plug#end()

colorscheme onedark
" hi Normal ctermfg=150 ctermbg=none

" ===
" === NERDTree
" ===
map <LEADER>j :NERDTreeToggle<CR>
nnoremap <LEADER>f :NERDTreeFind<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == ctrlp
" ==
let g:ctrlp_map = '<c-p>'

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === IndentGuides
" ===
map <LEADER>ig :IndentGuidesToggle<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'opera'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === vim header
" ===
let g:header_field_author = 'haoyi'
let g:header_field_author_email = 'haoyi@buaa.edu.cn'
let g:header_field_modified_by = 0
map <F1> :AddHeader<CR>

" ===
" === vim coc
" ===
set hidden
" set cmdheight=2
set nobackup
set nowritebackup
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <C-q> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ===
" === You Complete ME
" ===
" nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap g/ :YcmCompleter GetDoc<CR>
" nnoremap gt :YcmCompleter GetType<CR>
" nnoremap gr :YcmCompleter GoToReferences<CR>
" let g:ycm_autoclose_preview_window_after_completion=0
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_use_clangd = 0
" let g:ycm_python_interpreter_path = "/bin/python3"
" let g:ycm_python_binary_path = "/bin/python3"

" ===
" For python mode
" ===
" let g:pymode_python = 'python3'
" hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold
