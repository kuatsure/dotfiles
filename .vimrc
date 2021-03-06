" plug.vim -> https://github.com/junegunn/vim-plug
call plug#begin()

" Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'bubujka/emmet-vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'ap/vim-css-color'
" Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriseppstein/vim-haml'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
" Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'dahu/vim-fanfingtastic'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'luochen1990/rainbow'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wellle/targets.vim'
Plug 'misterbuckley/vim-definitive'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

filetype plugin indent on

let g:dracula_colorterm = 0
let g:dracula_italic=0

colorscheme dracula

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'filetype' ],
      \              [ 'linter_errors', 'linter_warnings' ], ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'git_branch' ],
      \             [ 'relativepath', 'modified', 'readonly' ], ]
      \ },
      \ 'component_function': {
      \   'git_branch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \ },
      \ 'component_type': {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ },
      \ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d', all_errors)
endfunction

if !has('gui_running')
    set t_Co=256
  endif

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set eol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Don't show the current mode
set noshowmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Tab key -> 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" reload files when changed on disk, i.e. via `git checkout`
set autoread

" writing the swap file faster
set updatetime=100

" Splitting right and down feels more natural
set splitbelow
set splitright

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd User ALELint call lightline#update()
endif

" let g:EditorConfig_core_mode = 'external_command'
" let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

" slam escape / save
inoremap jk <Esc>

inoremap jkk <Esc>:w<CR>
nnoremap jkk <Esc>:w<CR>

inoremap kjj <Esc>:x<CR>
nnoremap kjj <Esc>:x<CR>

" this stuff needs to go into a black hole
nnoremap <silent> dd "_dd
nnoremap <silent> d "_d
nnoremap <silent> cc "_cc
nnoremap <silent> c "_c
nnoremap <silent> D "_D
nnoremap <silent> C "_C
nnoremap <silent> s "_s
nnoremap <silent> S "_S

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Moving Lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gvV

nnoremap -          :call Explore()<CR>

nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :sp<CR>:Glog<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>

nnoremap <Leader>== =ip
nnoremap <silent> <Leader>/          :nohlsearch<CR>

" Fast editing and reloading of vimrc configs
map <leader>r :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc

" Search for current visual selection
vnoremap // y/<C-R>"<CR>

nnoremap <Leader>c  :tabnew<CR>
nnoremap <Leader>C  :tabclose<CR>
nnoremap <silent> <Leader>X  :tabnew<CR>:tabonly<CR>

nnoremap <Leader>V  :spl<CR>
nnoremap <Leader>v  :vsp<CR>

nnoremap <Leader>s  :call OpenNextFile(1)<CR>
nnoremap <Leader>S  :call OpenNextFile(-1)<CR>

nnoremap <Leader>a  :vsp<CR>:call OpenNextFile(1)<CR>
nnoremap <Leader>A  :spl<CR>:call OpenNextFile(1)<CR>

let g:indentLine_leadingSpaceEnabled=1

let g:javascript_plugin_jsdoc = 1

let g:used_javascript_libs = 'jquery, underscore, flux, react, handlebars'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" nmap <silent> <C-n> <Plug>(ale_toggle)
nmap <silent> <C-S-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'scss': ['stylelint']
\}
let g:ale_linters = {
\   'html': [],
\   'ruby': [],
\   'javascript': ['eslint', 'prettier'],
\   'jsx': ['stylelint', 'eslint']
\}
let g:ale_fix_on_save = 1

let g:rainbow_active             = 1
let g:rainbow_conf               = {
\  'ctermfgs': [ 'magenta', 'blue', 'yellow', 'red' ],
\  'separately': {
\    'html.handlebars': {
\      'parentheses': [ 'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold' ],
\    }
\  }
\}

let g:netrw_banner               = 0

nnoremap <Leader>d :FindDefinition<CR>

function! Explore()
  let last_file = expand('%:t')
  exe 'Explore'
  call search(last_file, 'wc')
endfunction

function! OpenNextFile(direction)
  let current_dir = expand('%:p:h')
  let current_file = expand('%:p')
  let current_dir_files = globpath(current_dir, '*', 0, 1)
  let current_file_index = index(current_dir_files, current_file)
  let next_file_index = current_file_index + a:direction

  while next_file_index != current_file_index
    if next_file_index == len(current_dir_files)
      let next_file_index = 0
    endif

    if filereadable(current_dir_files[next_file_index])
      exe 'edit ' . current_dir_files[next_file_index]
      break
    endif

    let next_file_index += a:direction
  endwhile
endfunction
