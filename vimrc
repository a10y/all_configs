set term=xterm-256color
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Force Vundle to use SSH instead of HTTPS for git cloning
let g:vundle_default_git_proto = 'git'

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'lrvick/Conque-Shell'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
" Language support
Plugin 'derekwyatt/vim-scala' " Scala
Plugin 'fatih/vim-go'         " Golang
Plugin 'leafgarland/typescript-vim' " TypeScript
" Color Schemes
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
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

filetype plugin indent on

set cursorline "Highlight the current line in normal/insert mode
set tabstop=4
set expandtab
set shiftwidth=4
set textwidth=120
set number
set paste
set nowrap
set incsearch
set hlsearch
set modeline
set fdm=marker
set encoding=utf-8
set ignorecase smartcase
set scrolloff=8
set timeout ttimeout timeoutlen=200 ttimeoutlen=200


"{{{ Colorscheme settings
highlight SpecialKey ctermfg=7
highlight NonText ctermfg=7
highlight LineNr ctermfg=7
"}}}


"{{{ Statusline settings
	set laststatus=2
	set statusline=%F\ %m%r%y\ [0x\%02.2B]\ \%=[%-3l,%-2c][%-L,%-4o]
	highlight StatusLine ctermbg=0 ctermfg=7 cterm=bold
"}}}


"{{{ Nerdtree settings
let NERD_java_alt_style=1
let NERD_c_alt_style=1
let NERDDefaultNesting=1
let NERDSpaceDelims=1
"}}}


"{{{ Define fold mappings
	function! NeatFoldText()
		let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
		let lines_count = v:foldend - v:foldstart + 1
		let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
		let foldchar = split(filter(split(&fillchars, ','), 'v:val =~# "fold"')[0], ':')[-1]
		let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
		let foldtextend = lines_count_text . repeat(foldchar, 8)
		let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
		return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
	endfunction
	set foldtext=NeatFoldText()

	nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
	vnoremap <Space> zf
"}}}


"{{{ Define indent mappings
"	vnoremap > >gv
"	vnoremap < <gv
"	au FileType yaml vnoremap > :s/^/    /g<CR>:noh<CR>gv
"	au FileType yaml vnoremap < :s/^    //g<CR>:noh<CR>gv
"}}}


"{{{ Commenting functions
function! Comment(ldelim, rdelim)
	let current_line = getline(".")
	let modified_line = substitute(current_line, '^\(\s*\)\(.\+\)$', '\1' . a:ldelim . '\2' . a:rdelim, "g")
	call setline(".", modified_line)
endfunction

function! Uncomment(ldelim, rdelim)
	let current_line = getline(".")
	let modified_line = substitute(current_line, '^\(\s*\)' . a:ldelim . '\(.*\)' . a:rdelim . '$', '\1\2', "g")
	call setline(".", modified_line)
endfunction
"}}}


"{{{ Define comment mappings
vnoremap . :call   Comment('# ', '')<CR>:noh<CR>gv
vnoremap , :call Uncomment('# ', '')<CR>:noh<CR>gv

au FileType c,cpp,java,javascript vnoremap . :call   Comment('\/\/ ', '')<CR>:noh<CR>gv
au FileType c,cpp,java,javascript vnoremap , :call Uncomment('\/\/ ', '')<CR>:noh<CR>gv

au FileType html,xml vnoremap . :call   Comment('<!-- ', ' -->')<CR>:noh<CR>gv
au FileType html,xml vnoremap , :call Uncomment('<!-- ', ' -->')<CR>:noh<CR>gv

au FileType vim vnoremap . :call   Comment('" ', '')<CR>:noh<CR>gv
au FileType vim vnoremap , :call Uncomment('" ', '')<CR>:noh<CR>gv

au FileType lua,haskell vnoremap . :call   Comment('-- ', '')<CR>:noh<CR>gv
au FileType lua,haskell vnoremap , :call Uncomment('-- ', '')<CR>:noh<CR>gv

au FileType tex vnoremap . :call   Comment('% ', '')<CR>:noh<CR>gv
au FileType tex vnoremap , :call Uncomment('% ', '')<CR>:noh<CR>gv
"}}}


 "{{{ Custom highlighting
" Define an Error highlight group
highlight Error ctermbg=red ctermfg=white


" Match lines over 80 characters long
"let h1 = matchadd('Error', '\%81v.\+')

" Match libes that mix tabs and spaces
let h2 = matchadd('Error', '^\s*\ \t\s*')
let h3 = matchadd('Error', '^\s*\t\ \s*')

" Match trailing whitespace
let h4 = matchadd('Error', '\s\+$')


au FileType md,tex :call matchdelete(h1)
au FileType md,tex :set spell
"}}}

set backspace=2
set mouse=a
set background=dark
syntax on
colorscheme molokai

"Highlighting
hi Visual ctermbg=200 guibg=#ff00ff


" Set the leader and other custom keymappings
let mapleader = "\<Space>"
nnoremap <leader>u viwU
nnoremap <leader>ev :split $MYVIMRC<cr>:echo "Opened config file"<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:echo "Resourced $MYVIMRC"<cr>
nnoremap <leader>sh :shell<cr>
set nopaste "Allow insert mappings
inoremap <c-q> ""<esc>hi
inoremap kj <esc>
nnoremap <leader>nt :NERDTree<cr>
inoremap <c-a> <esc>0i
inoremap <c-e> <esc>$a
nnoremap <leader><leader> <esc>:w<cr>

" Automatic file highliting
au BufCreate,BufRead *.gradle set filetype=groovy

" Airline config
let g:airline_powerline_fonts = 1
"
" Set trailing character code
set list
set lcs=trail:•,tab:\ \ 

" Set the background color correctly when redraw occurs
set t_ut=

" C++/C related settings
"
"

" Set the indentation for access modifiers in classes (e.g. public:, private:)
set cino=g0

function StartTerm()
    execute 'ConqueTermSplit' . $SHELL
    setlocal nolist
endfunction

nnoremap ss :call StartTerm()<cr>
