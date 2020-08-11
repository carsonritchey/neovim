" plugins
call plug#begin('~/.config/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug '907th/vim-auto-save'

	Plug 'dracula/vim'

call plug#end()

" plugin sources
	source $HOME/.config/nvim/plugged/vim-airline/airline.vim

" miscellaneous plug settings
	let g:auto_save = 1 " enables vim-auto-save
	set nowritebackup " recommended by coc
	set nobackup " recommended by coc
	function! s:check_back_space() abort " coc tab-completion
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

	inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" aesthetics
	syntax enable
	set number
	set cursorline
	set cmdheight=2
	set laststatus=2
	set wildoptions=pum
	
	set termguicolors
	set t_Co=256

	colorscheme dracula

" indentation
	set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
	set smartindent
	set autoindent
	set cindent
	set smarttab

" undo
	set noswapfile
	set undodir=~/.config/nvim/undodir
	set undofile

" miscellaneous
	let mapleader=" "
	set incsearch
	set ignorecase
	set nowrap
	set noerrorbells
	set splitbelow
	set splitright
	set laststatus=2 " powerline always on
	set mouse=a " helps with copying text from outside of nvim
	set encoding=UTF-8
	set wildmode=longest,list,full " tab completion for commands
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disables smart indent on comments
	set hidden " helps with buffers
	set updatetime=300 " faster completion
	set clipboard=unnamedplus " copy and paste in and out of vim
	set timeoutlen=500 "shortens timeout length
	filetype plugin on
	set iskeyword-=_

	let g:matchparen_timeout = 2

" remaps
	map <leader>s :setlocal spell! spelllang=en_us<CR> " space + s toggle spellcheck 
	nnoremap <F4> :make!<cr>
	nnoremap <F5> :!./a.out<cr>
