let mapleader = " " 
" Remap the leader + f to open FZF
nnoremap <leader>m :FZF<CR>
nnoremap <leader>s yiw:Ag <C-r>0<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>w :wq<CR>
nnoremap <leader>n :NERDTreeFind<CR>

" Plugins
call plug#begin()
Plug 'roxma/nvim-completion-manager' 
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'epmatsw/ag.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
call plug#end()

syntax on
autocmd vimenter * ++nested colorscheme gruvbox   

" Automatically open NERDTree when nvim opens
autocmd VimEnter * NERDTree | wincmd p

" Automatically close NERDTree when nvim closes
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Turn on line numbers
set number

" Clipboard
set clipboard=unnamedplus

" Auto-pair brackets, parenthesis, quote, etc
" inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
" inoremap [ []<Esc>i
" inoremap < <><Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" Tab behaviors
set autoindent    " maintain indentation from prev line
set tabstop=4     " number of spaces <Tab> represents.
set shiftwidth=4  " number of spaces for indentation.
set expandtab     " <Tab> inserts spaces, not '\t'

" Update time faster (default is 4000ms)
set updatetime=100
 
 
