" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

execute pathogen#infect()

set background=dark
"colorscheme solarized
"colorscheme gruvbox
colorscheme molokai
let g:molokai_original=1
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts=1
set laststatus=2
set hlsearch
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_play_open_browser = 0
let g:go_fmt_autosave = 0
let g:go_fmt_fail_silently = 1
let g:go_get_update = 0
let g:gofmt_command = "goimports"


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_config_file='.syntastic_cpp_config'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=" -std=c++11 -stdlib=libc++"

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1




autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif
map <C-t> :NERDTreeToggle<CR>
"map <C-s> :VimShell<CR>
nnoremap <C-x> :bd<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>
nnoremap <C-l> :nohlsearch<CR>
nmap <C-e> :TagbarToggle<CR>

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set rnu
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set wildmode=longest:full
set wildmenu
set wildignore=*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,.*.gif,*.pyo
set ignorecase
set smartcase
set incsearch
set modeline
set modelines=5
set textwidth=120
set scrolloff=3
set formatoptions=tcqb
set backspace=indent,eol,start

set ruler
set showmatch

filetype on
filetype plugin on

set dir=~/tmp
set makeprg=/usr/bin/make\ build_specs=debug
set listchars=tab:>-,eol:$,trail:.,extends:#
set virtualedit=block

:autocmd BufNewFile,BufRead *.make set noexpandtab list
if exists('!colorcolumn')
	:autocmd BufNewFile,BufRead *.{c,md,cxx,cpp,h,py} set colorcolumn=+1
else
	highlight OverLength ctermbg=darkblue ctermfg=yellow guibg=#FFD9D9
	:autocmd BufNewFile,BufRead *.{c,h,py} match OverLength /\%121v.\+/
endif
:autocmd BufNewFile,BufRead *.{c,h,py} set expandtab nolist

:hi SignColumn ctermbg=8
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^<>[]{}()\""
set ut=1
"
" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

