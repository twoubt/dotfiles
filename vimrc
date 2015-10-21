set nocompatible              " be iMproved, required
filetype off                  " required
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')

" themes
" Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rails'] }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails'] }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rails'] }

call plug#end()

filetype plugin indent on

" Leader
let mapleader = " "
nnoremap <LEADER>bb :!bundle install<CR>
nnoremap <LEADER>x <C-W>q
" change current buffer file path to file path of the open file
nnoremap <LEADER>cd :lcd %:p:h<CR>:pwd<CR>
" copy the entire buffer
nnoremap <LEADER>co ggVGy
nnoremap <LEADER>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
nnoremap <LEADER>ee :e .<CR>
nnoremap <LEADER>fq :q!<CR>
" silently add all files in current path, commit and push. note path is the
" path of vim, not the file
nnoremap <LEADER>gcp :silent !ga .<CR>:silent !gc<CR>:!gp<CR>
" git add, commit and push for vimrc changes
nnoremap <LEADER>ggp :lcd ~/dotfiles <CR>:silent !ga .<CR>:silent !gcmsg 'updated vimrc'<CR>:!gp<CR>
nnoremap <LEADER>h :nohlsearch<CR>
nnoremap <LEADER>hs :new %:p:h<CR>
nnoremap <LEADER>hsf :new<C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
" auto indent file and move cursor back to triggered location.
nnoremap <LEADER>i mmgg=G`m<CR>
nnoremap <LEADER>n :call RenameFile()<CR>
" paste from system clipboard at current indent level
nnoremap <LEADER>pa :set paste<CR>o<ESC>"*]p :set nopaste<CR>
" source, clean, install and update plugins
nnoremap <LEADER>pp :source $MYVIMRC<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><C-W>q
" echo current file path
nnoremap <LEADER>pwd :echo expand("%:p")<CR>
" remove trailing white spaces
nnoremap <LEADER>rw :%s/\s\+$//e<CR>
nnoremap <LEADER>so :source $MYVIMRC<CR>:AirlineRefresh<CR>
nnoremap <LEADER>X :tabclose<CR>
nnoremap <LEADER>u :call MergeTabs()<CR>
nnoremap <LEADER>vi :tabe $MYVIMRC<CR>
nnoremap <LEADER>vs :vnew %:p:h<CR>
nnoremap <LEADER>vsf :vnew<C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>wq :wq<CR>
" zoom a vim pane
nnoremap <LEADER>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <LEADER>Z :wincmd =<CR>
nnoremap <LEADER>tm :tabe ~/.tmux.conf<CR>
nnoremap <LEADER>zs :tabe ~/.zshrc<CR>

" vim-rspec mappings
nnoremap <LEADER>l :call RunLastSpec()<CR>
nnoremap <LEADER>s :call RunNearestSpec()<CR>
nnoremap <LEADER>t :call RunCurrentSpecFile()<CR>
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" Switch between the last two files
nnoremap <LEADER><LEADER> <C-^>

" jk to escape input and visual mode
inoremap jk <ESC>
inoremap kj <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>

" create new tab
map <C-T> <ESC>:tabnew .<CR>
" arrow keys do nothing
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
map <UP> <NOP>
" disable K (which is lookup word under cursor)
map K <NOP>
" quicker line yank
nnoremap Y yy
" ignore wrapped lines
nnoremap j gj
nnoremap k gk
" paste at current indent level
nnoremap P P=`[<ESC>
nnoremap p p=`[<ESC>
" move line up or down with alt jk
nnoremap ˚ :m -2<CR>
nnoremap ∆ :m +1<CR>
" remove - and + moves up and down
map + <NOP>
map - <NOP>

" Quicker window movement
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <C-W>h <C-W>H
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L

" for the typos
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" auto remove trailing white spaces for these files
autocmd BufWritePre *.rb :%s/\s\+$//e

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

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
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" vim airline
let g:airline_theme="tomorrow"
let g:airline_powerline_fonts = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%:

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
