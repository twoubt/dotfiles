set nocompatible              " be iMproved, required
filetype off                  " required
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
"powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" themes
Plug 'flazz/vim-colorschemes'

Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails'] }
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails', { 'for': 'rails' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rails'] }

call plug#end()

filetype plugin indent on

" Leader
let mapleader = " "
nnoremap <LEADER>bb :!bundle install<CR>
nnoremap <LEADER>bc <C-W>q
nnoremap <LEADER>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <LEADER>co ggVGy
nnoremap <LEADER>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
nnoremap <LEADER>ee :e .<CR>
nnoremap <LEADER>fq :q!<CR>
nnoremap <LEADER>gcp :silent !ga .<CR>:silent !gc<CR>:!gp<CR>
nnoremap <LEADER>ggp :lcd ~/dotfiles <CR>:silent !ga .<CR>:silent !gcmsg 'updated vimrc'<CR>:!gp<CR>
nnoremap <LEADER>h :nohlsearch<CR>
nnoremap <LEADER>hs :new %:p:h<CR>
nnoremap <LEADER>hsf :new<C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <LEADER>i mmgg=G`m<CR>
nnoremap <LEADER>n :call RenameFile()<CR>
nnoremap <LEADER>pa :set paste<CR>o<ESC>"*]p :set nopaste<CR>
nnoremap <LEADER>pp :source $MYVIMRC<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><C-W>q
nnoremap <LEADER>pwd :echo expand("%:p")<CR>
nnoremap <LEADER>rw :%s/\s\+$//e<CR>
nnoremap <LEADER>so :source $MYVIMRC<CR>
nnoremap <LEADER>tc :tabclose<CR>
nnoremap <LEADER>u :call MergeTabs()<CR>
nnoremap <LEADER>vi :tabe $MYVIMRC<CR>
nnoremap <LEADER>vs :vnew %:p:h<CR>
nnoremap <LEADER>vsf :vnew<C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>wq :wq<CR>

" vim-rspec mappings
nnoremap <LEADER>l :call RunLastSpec()<CR>
nnoremap <LEADER>s :call RunNearestSpec()<CR>
nnoremap <LEADER>t :call RunCurrentSpecFile()<CR>

" Switch between the last two files
nnoremap <LEADER><LEADER> <C-^>

inoremap jk <ESC>
inoremap kj <ESC>
map <C-T> <ESC>:tabnew .<CR>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
map <UP> <NOP>
map K <NOP>
nnoremap P P=`[<ESC>
nnoremap Y yy
nnoremap j gj
nnoremap k gk
nnoremap p p=`[<ESC>
nnoremap ˚ :m -2<CR>
nnoremap ∆ :m +1<CR>
vnoremap jk <ESC>
vnoremap kj <ESC>

" Quicker window movement
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <C-W>h <C-W>H
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

autocmd BufWritePre *.rb :%s/\s\+$//e

set autoindent
set autoread
set autowrite     " Automatically :write before running commands
set backspace=indent,eol,start
set complete+=kspell
set cursorline
set diffopt+=vertical
set expandtab
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set lazyredraw
set list listchars=tab:»·,trail:·,nbsp:·
set nobackup
set noerrorbells
set nofoldenable
set noshowmode
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set number
set numberwidth=5
set relativenumber
set ruler         " show the cursor position all the time
set scrolloff=5
set shiftround
set shiftwidth=2
set shortmess=a
set showcmd       " display incomplete commands
set showmatch
set smartcase
set smarttab
set spellfile=$HOME/.vim-spell-en.utf-8.add
set splitbelow
set splitright
set tabstop=2
set timeoutlen=800
set ttimeout
set ttimeoutlen=1
set ttyfast
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.jpeg
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/rails/**
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildmenu
set wildmode=list:longest,list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" theme
set t_Co=256
syntax enable
set background=dark
colorscheme wombat256

" Syntax setting start
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
      \ {"regex": "possibly useless use of a variable in void context"}
" Syntax setting end

let g:UltiSnipsExpandTrigger="<tab>"
let g:neocomplete#enable_at_startup = 1
let g:user_emmet_mode='a'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
