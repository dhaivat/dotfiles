set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_lazy_load=1

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Git
Plugin 'tpope/vim-fugitive'

" System
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Gist.vim'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'

" Syntax
Plugin 'leshill/vim-json'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'itspriddle/vim-jquery'
Plugin 'atourino/jinja.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 't9md/vim-chef'
Plugin 'majutsushi/tagbar'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'fs111/pydoc.vim'

" Go
Plugin 'fatih/vim-go'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

" Pig
Plugin 'motus/pig.vim'

" Fun, but not useful
Plugin 'flazz/vim-colorschemes'
Plugin 'skammer/vim-css-color'

" Tmux + Repl
Plugin 'jgdavey/tslime.vim'

" Required after vundle plugin definitions
call vundle#end()            " required
filetype plugin indent on

" Wildmenu
set wildmenu
set wildmode=list:longest:full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                          " Cursed Java class files

" Ignore in buffer explorer
let g:netrw_liststyle= 1 " Tree-mode
let g:netrw_list_hide= '.*\.swp$,.*/$'

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! :wa
au TabLeave * silent! :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Basics
syntax enable
set number        " always show line numbers
set hidden        " Allow un-saved buffers in background
noremap Y "+y     " Don't yank to system clipboard by default - use Y for that.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "  case-sensitive otherwise
set cursorline
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set guifont=Hack:h13

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Default background & theme
set background=dark
colorscheme marklar
let g:airline_theme='molokai'

if has("gui_running")
  set guioptions=-t
  colorscheme obsidian2
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

" Default Tabs & spaces
set modeline      "
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" General Code Folding
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" C-W moves faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" gotta have some autocomplete
" Remap omni-complete to avoid having to type so fast
" iunmap <C-Space>
" Mapping to C-@ for mac because iTerm2 and Terminal interprete C-Space as C-@
" thank you - http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim
inoremap <C-@> <C-x><C-o>
" SuperTab will use C-@ as well, works like a charm

"
" Enable spellchecking conditionally
" spell check english
map <Leader>se :setlocal spell spelllang=en_us<CR>
" spell check spanish
map <Leader>ss :setlocal spell spelllang=es_es<CR>
map <Leader>sn :setlocal nospell<CR>


" General auto-commands
au FileType * setlocal colorcolumn=0
" au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
au FileType mail highlight clear ExtraWhitespace
au FileType mail setlocal listchars=

" Markdown configurations
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Ruby Configurations
au filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80

" PHP Configurations
au FileType php setlocal colorcolumn=100

" HTML configurations

autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

" Javascript configurations
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Ensure that JSON files have their filetype properly set.
au BufRead,BufNewFile *.json set filetype=json

" Get jinja filetype selection working correctly for *.jinja.html files.
au BufNewFile,BufReadPost *.jinja* setlocal filetype=htmljinja

" Get rid of search hilighting with ,/
nnoremap <silent> <Leader>] :nohlsearch<CR>
nnoremap <silent> <Leader><Leader> :TComment<CR>

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all


" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null


" Plugin Configurations
"""""""""""""""""""""""
" Disable Java syntastic checker - too slow.
let g:syntastic_enable_java_checker = 0

" puppet macro
let @p='gg:%s/\( =>.*[^,]\)$/\1,/g'


" notes saved in dropbox
let g:notes_directories = ['~/Dropbox/vim-notes']

" Pyflakes
"au BufWritePost *.py call Flake8()
let g:pyflakes_use_quickfix = 0
let g:flake8_ignore="E128,E501"
let g:syntastic_python_checker_args='--ignore=E501,E128'

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1
let g:gist_post_private = 1

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 30

" crtl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'  " search anything (in files, buffers and MRU files at the same time.)
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_working_path_mode = 'c' " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1 " show the match window at the top of the screen
let g:ctrlp_max_height = 10 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_use_caching = 1 " enable caching
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 0 " don't show me dotfiles
let g:ctrlp_mruf_max = 250 " number of recently opened files
nmap ; :CtrlPBuffer<CR>

" Double rainbow - What does it mean!? No Idea.
let g:rainbow_active = 1

set laststatus=2
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_puppet_lint_disable = 0

" Airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" NerdTree
map <C-t>  :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" close scratch/preview buffer after omnicomplete insert
let g:pyflakes_use_quickfix = 0
let g:pymode_rope = 0
let g:pymode_syntax_all = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "right"
let g:pymode_lint_checkers = ['pyflakes', 'mccabe']

" So this works with YCM
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Python configurations
" jedi-vim + YCM
au FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
au FileType python setlocal colorcolumn=100
au FileType python map <buffer> <F4> :call Flake8()<CR>
au FileType python au BufWritePre * :%s/\s\+$//e
au FileType python let g:jedi#auto_vim_configuration = 0
au FileType python let g:jedi#popup_on_dot = 0
au FileType python let g:jedi#popup_select_first = 0
au FileType python let g:jedi#completions_enabled = 0
au FileType python let g:jedi#completions_command = ""
au FileType python let g:jedi#show_call_signatures = "1"
au FileType python let g:jedi#rename_command = "<leader>r"

let g:pymode_run = 0

" go mappings
au filetype go setlocal colorcolumn=100 invlist
au filetype go setlocal colorcolumn=
au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader><Leader><Leader> <Plug>(go-import)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-vet)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go setlocal noexpandtab
au FileType go setlocal list listchars=tab:\ \ 
au FileType go au BufWritePre <buffer> GoFmt

au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif

" Racket/Scheme
au FileType lisp,scheme,art setlocal equalprg=scmindent.rkt
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" TsLime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif
