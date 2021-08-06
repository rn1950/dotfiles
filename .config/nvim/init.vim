let mapleader = " "
" Remap the leader + f to open FZF
nnoremap <leader>m :FZF<CR>
nnoremap <leader>s yiw:Ag <C-r>0<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>w :wq<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>0 <C-w>k
nnoremap <leader>l <C-w>j
nnoremap <leader>p <C-w>l
nnoremap <leader>o <C-w>h
nnoremap <leader>u :bp<CR>
nnoremap <leader>i :bn<CR>
nnoremap <leader>j :bp<bar>sp<bar>bn<bar>bd<CR>

autocmd VimEnter * e ~/dotfiles/trynaGoFast.txt 

" Plugins
call plug#begin()
" Plug 'roxma/nvim-completion-manager' 
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'epmatsw/ag.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
" Plug 'morhetz/gruvbox'
" Plug 'neovim/nvim-lspconfig'
Plug 'jacoborus/tender.vim'
call plug#end()

syntax on
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox  
set termguicolors
colorscheme tender
let g:airline_theme = 'tender'


" Automatically open NERDTree when nvim opens
autocmd VimEnter * NERDTree | wincmd p

" Automatically close NERDTree when nvim closes
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Turn on line numbers
set number

" Set mouse mode to on
set mouse=a

" Clipboard
set clipboard=unnamedplus

" Set to non-caps sensitive search by default
set ic

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
 
 
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
EOF
