let mapleader=" "

syntax enable

set exrc
set nowrap
set nohlsearch
set relativenumber
set number
set hidden
set noerrorbells
set ruler
set title
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set scrolloff=8
set encoding=utf-8
set signcolumn=yes
" set shell=powershell.exe
"set clipboard+=unnamedplus


" set spell 
" set spelllang=sv
" hi clear SpellBad
" hi SpellBad cterm=underline ctermfg=red
" set nospell

imap jk <Esc>
tnoremap jk <C-\><C-n>

" Swerty stuff
nnoremap ö ;
nnoremap Ö :
nnoremap ä '
nnoremap Ä "
nnoremap å [
nnoremap Å {
nnoremap ´ ]
nnoremap ` }

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>se :e $MYVIMRC<CR>

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'neovim/nvim-lspconfig'
" Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'  
Plug 'ojroques/nvim-lspfuzzy', {'branch': 'main'}

Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" Plug 'nikvdp/neomux'
Plug 'mhinz/vim-startify'

Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LSP
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" lua require'lspinstall'.setup()
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }

"" Tree sitter

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true, }, }
" Indentation, idk how/if it works
lua require'nvim-treesitter.configs'.setup { indent = { enable = true } }

"" Fugitive
nmap <leader>gs :G<CR>

"" FZF
lua require'lspfuzzy'.setup {}

