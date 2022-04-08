" no, i don't need vi… why is this even a thing?
set nocompatible

" syntax-highlighting and plugins
syntax enable
filetype plugin on

" search files in subdirectories
set path+=**

" DON'T YELL AT ME EVERY TIME!
set visualbell
set t_vb=

" show matching files
set wildmenu

" create tags-file
command! MakeTags !ctags -R .
set tags=tags,.git/tags,.tags
" ignore case when searching for tags
set ignorecase
" regenerate on save
function! PutTags()
	if filewritable(expand(".git/"))
		silent !find . -name node_modules &>/dev/null || ctags -R -f .git/tags .
	endif
endfunction
autocmd BufWritePost *.go,*.c,*.cpp,*.h,*.js,*.css,*.tex,*.php,*.md :call PutTags()

" shorter messages
set shortmess=at

" show lines around the cursor
set scrolloff=2

" autoload changes
set autoread

" autocomplete
" remap ^x^f to ^f
imap <C-f> <C-x><C-f>

" highlight search results and clear by pressing enter
set incsearch
set hlsearch

" Line numbers please
set number

" and a ruler
set colorcolumn=80

" now lets get some nice tabs… spaces are so last century
set autoindent
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" folding is useful
set foldlevel=99
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" don't mess with my code.
set textwidth=0
set wrapmargin=0

" align wrapped lines
set breakindent
set formatoptions=l
set lbr

if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  execute '!sudo pacman -Syu go cmake python base-devel nodejs npm cmake python-pynvim --noconfirm'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')
" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Go Toolchain
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}

" unclutter markdown editing
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'md'] }
Plug 'shushcat/vim-minimd', { 'for': ['markdown', 'md'] }

" indented pasting
" Plug 'sickill/vim-pasta'

" better undo history
Plug 'mbbill/undotree'

" autoformatter
Plug 'Chiel92/vim-autoformat'

" text-aligning
Plug 'tommcdo/vim-lion'

" VimRC Benchmarker
Plug 'mattn/benchvimrc-vim'

" Buffer overview
"Plug 'bagrat/vim-buffet'
Plug 'vim-airline/vim-airline'

" May Tim Pope be blessed!
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'

" Go everywhere easily
" Plug 'easymotion/vim-easymotion'

" Highlight Colors
Plug 'chrisbra/colorizer'

" Code Completion, heavy af but sooo comfy
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --ts-completer --rust-completer', 'for': ['go', 'js', 'rs', 'c']}

" saving cursor positions and folding information
Plug 'vim-scripts/restore_view.vim'

" for presentations at work I use st which is not so happy with true color
Plug 'w0ng/vim-hybrid'

Plug 'cespare/vim-toml', {'for': ['toml']}

" Format text for documentation
Plug 'vim-scripts/TextFormat'

" Preview LaTeX when editing
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Retab Files
Plug 'Thyrum/vim-stabs'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
call plug#end()

" apply theme
set termguicolors
let g:dracula_colorterm = 0
let g:airline_theme                      = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts            = 1

" Reload vim Config
nmap <F5> :source ~/.vimrc<cr>

" Ctrl+(Up/Down) to move line up/down
map <C-UP>   ddkP
map <C-Down> ddp

" Toggle Undo Tree
nnoremap <S-U> :UndotreeToggle<CR>

" select/list tabs and enable file menu on F5
map      tz   :bn<cr>
map      tr   :bp<cr>
map      tc   :bd<cr>
map      tl   :buffers<cr>
nnoremap <F4> :buffers<cr>:buffer<Space>

" TODO: can I make it work with arrow-keys?
nnoremap gln :lnext<cr>
nnoremap glp :lprev<cr>
nnoremap gll :ll<cr>

" define git-shortcuts
map gb  :b#<cr>
map gs  :Gstatus<cr>
map gc  :Git commit<cr>
map gpl :Git pull<cr>
map gps :Git push<cr>

autocmd BufWritePre *.go,*.c,*.cpp,*.h,*.js,*.css,*.tex,*.php :silent Autoformat
autocmd BufWritePre * :%s/\s\+$//e

" Setup Buffer overview
let g:buffet_powerline_separators = 1
let g:buffet_show_index           = 1

" navigate split windows with Shift+Direction, maximise with Ctrl+M
nmap <silent> <S-Up>    :wincmd k<CR>
nmap <silent> <S-Down>  :wincmd j<CR>
nmap <silent> <S-Left>  :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>
map  <C-M>    <C-W>_

" Toggle Undo Tree
nnoremap <S-U> :UndotreeToggle<CR>

" show commit that introduced line
map <silent>gb :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" highlight trailing whitespaces
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL

" clear search highlight on Esc/Enter in normal mode
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <silent> <CR>  :noh<return><esc>
nnoremap <esc>^[  <esc>^[

" vim-go settings
let g:go_fmt_command   = "gopls"
let g:go_gopls_gofumpt = 1

" custom go bindings
nmap gie :GoIfErr<CR>
nmap gis :GoFillStruct<CR>

nmap gF :e <cfile><cr>

colorscheme dracula_pro

map [5~ <nop>
map [6~ <nop>

" LaTeX autopreview
autocmd BufNewFile,BufRead *.tex LLPStartPreview
let g:livepreview_previewer = 'zathura'

" restore cursor positions and folding
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

let g:snipMate = { 'snippet_version' : 1 }

imap <F4> <plug>snipMateNextOrTrigger

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set updatetime=500
set balloondelay=250
set signcolumn=yes
