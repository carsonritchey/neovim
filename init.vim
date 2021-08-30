" plugins
call plug#begin("~/.config/nvim/plugged")
	" misc
	Plug '907th/vim-auto-save'
	Plug 'itchyny/lightline.vim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'nvim-lua/lsp_extensions.nvim'

	" colorscheme
	Plug 'dracula/vim'
call plug#end()

" plugin settings
let g:auto_save = 1 " enables autosave
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'background': 'dark',
	\ }

	" lsp stuff
set completeopt=menuone,noinsert,noselect
set shortmess+=c
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)
set signcolumn=yes
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


" aesthetics
syntax enable
set number
set cursorline
set showcmd
set cursorline
set cmdheight=2
set laststatus=2
set wildoptions=pum
set termguicolors
if !has('gui_running')
	set t_Co=256
endif
set nowrap

colorscheme dracula

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" indentation
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set smarttab

" misc
let mapleader=" "
filetype plugin indent on
set noerrorbells
set backspace=indent,eol,start
set noswapfile
set nobackup
set splitright
set splitbelow
set encoding=utf-8
set mouse=a " helps with copying text from outside of nvim
set clipboard=unnamedplus " helps with copying text from outside of nvim
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disables smart indent on comments
set hidden " helps with buffers
set iskeyword-=_ " underscores seperate words 

" remaps
nnoremap <leader>t :vs \| term<cr>
nnoremap <leader>o :NvimTreeToggle<cr>
nnoremap ; :
nmap <leader>p "0p
nmap <leader>P "0P

" LSP config stolen from https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF
