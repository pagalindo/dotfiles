set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Plugins
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'henrik/vim-reveal-in-finder'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'matze/vim-move'
Plugin 'mhinz/vim-blockify'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/vitality.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'

" Tmux
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'edkolev/tmuxline.vim'

" Python
Plugin 'jmcantrell/vim-virtualenv'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Colors
Plugin 'altercation/vim-colors-solarized'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'groenewege/vim-less'
Plugin 'beyondwords/vim-twig'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-liquid'
Plugin 'rodjek/vim-puppet'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Non-Plugin stuff after this line

"" Basics
set number
syntax on
set encoding=utf-8
set mouse=a

"" Things like whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set list
set autoindent
set linespace=3
set formatoptions=qrn1
set formatoptions+=w
set cursorline

" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

"" show where line ends
"" use gq to apply formatting
set textwidth=80
set colorcolumn=81

au BufRead,BufNewFile *.md setlocal formatoptions+=ct

"" who even wants swap files???
set noswapfile
set nobackup
set nowb

"" what mode is i am?
set showmode

"" display things like newlines, carriage returns, whitespace, etc...
set listchars=""
set listchars+=tab:▸\
" set listchars+=eol:¬
set listchars+=trail:.
" set listchars+=extends:>
" set listchars+=precedes:<

" ☠
" ❤

"" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <silent> ,/ :nohlsearch<CR>
hi Search    cterm=NONE ctermfg=white ctermbg=5

"" undo forever and ever
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"" wildcard settings
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/node_modules/*,*/bower_components/*,*/dist/*
set wildignore+=*/env/*,*/venv/*,*/devenv/*,*/__pycache__/*,*/.divshot-cache/*
set wildignore+=.DS_Store

"" set <leader> to ,
let mapleader = ","
set timeoutlen=500

"" enable code folding
set foldenable
set foldmethod=syntax
set foldlevelstart=99

"" hide mouse when typing
set mousehide

"" split windows below the current window.
set splitbelow

"" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"" map escape key to jk -- much faster
" also, <C-c> and <C-[>
imap jk <esc>
imap jj <esc>
imap kk <esc>

"" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom. More natural than default:
set splitbelow
set splitright

" Visually select the text that was last edited/pasted
nmap gV `[v`]

"" highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white

"" yank text to the OS X clipboard
set clipboard=unnamed

"" preserve indentation while pasting text from the OS X clipboard
"" use ,p dummy
noremap <Leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"" kill all trailing whitespace
function! <SID>RemoveWhitespaces()
  let l = line(".")
  let c = col(".")
  execute '%s/\s\+$//e'
  call cursor(l, c)
endfunction
nnoremap <silent> <Leader><Space> :call <SID>RemoveWhitespaces()<CR>

" Remove white spaces on write
augroup AutoRemoveWhitespace
  autocmd!
  autocmd BufWritePre * :call <SID>RemoveWhitespaces()
augroup END

"" up/down keys move by row, rather than line
nnoremap j gj
nnoremap k gk

"" switch buffers without saving
set hidden

"" bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

"" bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"" Reload .vimrc after editing and saving
augroup AutoSourceVimrc
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Leader-v to edit vimrc
nmap <Leader>v :e $MYVIMRC<CR>

" Buffer switching
nnoremap <Leader><Leader> <c-^>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Buffer closing (without deleting split)
nnoremap <silent> <Leader>d :bp\|bd #<CR>

" set scss files RIGHT
au BufRead,BufNewFile *.scss set filetype=scss


" CTAGS  -------------------------------------------------------------------

" Set tag file location
set tags+=.git/tags

" Function to regenerate tag file
function! FlushCtags()
  silent! exe ":!ctags ."
endfunction

" mapping to regenerate tags file
" silent! nnoremap <silent> TT :call FlushCtags()<CR>

" mapping to toggle tagbar
nnoremap <Leader>. :TagbarToggle<cr>

" mapping to use ctrlp tags function
nnoremap <silent> <Leader>b :CtrlPTag<CR>

"" mapping to update jsctags in current directory
nnoremap <Leader>jt :!jsctags .<CR>


"" PLUGINS -------------------------------------------------------------------

" Airline, a powerline replacement
let g:airline_powerline_fonts = 1
" let g:airline_section_b = '%{getcwd()}'
" let g:airline_section_c = '%t'
let g:airline#extensions#tabline#enabled = 1


"" Blockify
let g:blockify_pairs = {
      \ 'c':    [ '{', '}' ],
      \ 'cpp':  [ '{', '}' ],
      \ 'java': [ '{', '}' ],
      \ 'php': [ '{', '}' ],
      \ 'css': [ '{', '}' ],
      \ 'scss.css': [ '{', '}' ],
      \ 'scss': [ '{', '}' ],
      \ 'javascript': [ '{', '}' ],
      \ 'php.drupal': [ '{', '}' ],
      \}


"" Numbers
let g:numbers_exclude = ['nerdtree']

"" Nerd Tree
nnoremap <Leader>n :NERDTree<CR>

"" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checkers = ['jshint']


"" EasyMotion
let g:EasyMotion_leader_key = '<Space>'


"" Ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 0


"" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

"" Options to add support for Coffeescript
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }


"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"" Sparkup
let g:sparkupNextMapping="<c-s>"

"" Vimux
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

"" Colors and type------------------------------------------------------------
set guifont=Inconsolata\ for\ Powerline:h14
colorscheme bubblegum
if has('gui_running')
  set go-=T
endif

" allows ctrl-arrowkey to move lines up and down if using tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" saves cursor position when switching buffers
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" keeps window positions when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif


"" MACROS -------------------------------------------------------------------
" console.log();
let @c = 'yss)Iconsole.logjjA;jj'
" console.log("");
let @p = 'yss"yss)Iconsole.logjjA;jj'
" this.get("")i
let @g = 'ysiw)lysiw"hithis.getjjl%a'
" this.set("", i)
let @s = 'ysiw)lysiw"hithis.setjjl%i, '
" f: function() {
    " i
" },
let @m = 'A: function() {},jjhi'
