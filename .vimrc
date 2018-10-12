" VIM SETTINGS before plugins
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ","
" set numberlines
:set number
:set relativenumber
:set showmatch

" remapping leader keys
nnoremap <SPACE> <nop>
let mapleader = " "

:nnoremap <leader>d yiw/\<<C-r>0\><CR>N

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <TAB> :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Split Navigation
nnoremap <C-w>h :wincmd h<cr>
nnoremap <C-w>j :wincmd j<CR>
nnoremap <C-w>k :wincmd k<CR>
nnoremap <C-w>l :wincmd l<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" highlighting extra whitespace
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-signify'
Plugin 'jacoborus/tender.vim'
" Color Scheme Plugin
Plugin 'trevordmiller/nova-vim'
Plugin 'morhetz/gruvbox'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" Fuzzy search
Plugin 'kien/ctrlp.vim'
" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
" Airline
Plugin 'vim-airline/vim-airline'
"JS Plugins"
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
"CSS/HTML Plugins
"Code Snippets
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
"  All of your Plugins must be added before the following line
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

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme nova

set background=dark
" let g:gruvbox_contrast_dark='soft'
" Tab and space settings
set expandtab
set shiftwidth=4
set softtabstop=4


"PLUGIN SETTINGS
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NerdTree
"Open NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" THIS IS KIND OF HACKY, but ther is a defect in NerdTree that closes vim when
" you are closing a single buffer with NerdTree Open
" However this is also kind of clever as it prevents vim from closing because
" it requires a 'previous' (more than one) buffer to exist
nnoremap <leader>q :bp<cr>:bd #<cr>

"CTRLP

"ALE CONFIG
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\}
nnoremap <leader>f :ALEFix<cr>

"IGNORE FILES AND DIRECTORIES
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = 'node_modules\|DS_STORE\|hg|git|bin\|karma_test_results\|jest-coverage\'

"Airline
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

"Tab line
let g:airline#extensions#tabline#enabled = 1

"Signify Settings
let g:signify_vcs_list = [ 'git', 'hg' ]
