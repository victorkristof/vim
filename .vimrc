" Victor Kristof

" VIM-PLUG {{{

" I use vim-plug as plugin manager: https://github.com/junegunn/vim-plug
" You can specify a directory for plugins (.vim/plugged/ by default)
call plug#begin()

" Plugins come here - make sure you use single quotes

" Using % will match more than one character
Plug 'matchit.zip'
" Multiple selection for VIM (SublimeText-like)
Plug 'terryma/vim-multiple-cursors'
" Solarized for vim"
Plug 'altercation/vim-colors-solarized'
" NERDtree to get a tree view of your project
Plug 'scrooloose/nerdtree'
" Add git flags in NERDtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Add git signs in the left column
Plug 'airblade/vim-gitgutter'
" Git wrapper so awesome it should be illegal
Plug 'tpope/vim-fugitive'
" No-BS Python code folding
Plug 'tmhedberg/simpylfold'
" Status bar that is light as air
Plug 'bling/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'
" Fuzzy finder
Plug 'kien/ctrlp.vim'
" Intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" Syntax checking
Plug 'scrooloose/syntastic'
" " Code-completion engine
" Plug 'valloric/youcompleteme'
" Autocompletion for Python
Plug 'davidhalter/jedi-vim'
" Performs completion with tab
Plug 'ervandew/supertab'
" Markdown mode
Plug 'plasticboy/vim-markdown'
" Modern plugin to edit LaTeX files
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

" }}}
" COLORS {{{

syntax enable               " Enable syntax highlighting
set background=light        " Use light theme
colorscheme solarized       " Eyes-friendly colorscheme

" }}}
" SPACES AND TABS {{{

set tabstop=4               " Number of noremappaces per tab
set softtabstop=4           " Number of spaces in tab when editing
set expandtab               " Tab are spaces
set autoindent              " Indent when moving to the next line while writing
set shiftwidth=4            " Indent lines by 4 spaces
" Make backspaces more powerfull
set backspace=indent,eol,start
" Add blank line above cursor
nnoremap J o<ESC>
" Add blank line below cursor
nnoremap K O<ESC>

" }}}
" UI CONFIG {{{

set encoding=utf-8          " Set utf-8 compatible
set number                  " Show line numbers
set relativenumber          " Enable relative numbers
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
filetype indent on          " Load filetype-specific indent files
filetype plugin on          " Load fileypte-specific plugins
set wildmenu                " Visual autocomplete for command menu
" set lazyredraw              " Redraw only when needed (faster macros)
" set ttyfast                 " Faster redraw
set showmatch               " Highlight matching parenthesis
set mouse=a                 " Enable the mouse
set splitbelow              " Open split below
set splitright              " Open split right
set foldcolumn=2            " Display column on the left that shows folds
set laststatus=2            " Always display statusline
set wrap linebreak nolist   " Softwrap text longer than window width
" Set default font in GUI
set guifont=Menlo\ for\ Powerline:h14
" Display a vertical line at width 80 and 120
set colorcolumn=80
" Set color of column on the right
highlight ColorColumn ctermbg=254 guibg=#eee8d5
" Display a vertical line at width 80 and color background after width 120
" let &colorcolumn="80,".join(range(120,999),",")
" Highlight text over 80 characters
" highlight OverLengthSoft ctermfg=166 guifg=#592929
" match OverLengthSoft /\%79v.\+/
" Highlight text over 120 characters
" highlight OverLengthHard ctermfg=124 guifg=#592929
" 2match OverLengthHard /\%119v.\+/
" Set color of line number background
highlight CursorLineNr guibg=#eee8d5
" Informative status line
set statusline=%F%m%r%h%w\ [%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
" Increase size of buffer window
nnoremap + <C-w>+
" Decrease size of buffer window
nnoremap _ <C-w>-

" }}}
" SEARCHING {{{

set incsearch               " Search as you type
set hlsearch                " Highlight matches
set ignorecase              " Ignore case by default
set gdefault                " Substitute all occurences by default
" Turn off search highlight
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" }}}
" FOLDING {{{

set foldenable              " Enable folnoremappace toggles folds
nnoremap <Space> za
" Space creates folds in visual mode
vnoremap <Space> zf
" Toggles all folds in file
nnoremap - :call ToggleAllFolds()<CR>:echo<CR>
" Change color of folded code
highlight Folded ctermbg=grey

" }}}
" MOVEMENT {{{

" Disable arrow keys in normal, visual and insert modes
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Highlight last inserted text
nnoremap gV `[v`]
" Facilitate navigation between buffers
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
let maplocalleader=";"      " Local leader is comma
" Toggle Gundo
" nnoremap <Leader>u :GundoToggle<CR>
" Edit vimrc in new tab
nnoremap <Leader>vc :tabe ~/.vimrc<CR>
" Save session
" nnoremap <Leader>s :mksession<CR>
" Open ag.vim
" nnoremap <Leader>a :Ag

" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>
" Visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv

"}}}
" MISC {{{

set nobackup                " Disable backup, git can do this work
set noswapfile              " Disable .swp files
set nocompatible            " Ditch vi
" jk is <Esc>
inoremap jk <C-[>
" Save the buffer
nnoremap <C-s> :w<CR>
" Close the buffer
nnoremap <C-q> :q<CR>

" }}}
" CTRLP {{{

" Change CtrlP mapping
let g:ctrlp_map = '<C-Space>'
" Change order from top to bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
" Change working directory during Vim session
let g:ctrlp_working_path_mode = 0
" Use Ag to search for files
let g:ctrlp_user_command = 'ag %s -li --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" Ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" }}}
" MULTI-CURSOR SETTINGS {{{

" Replace defaults
" let g:multi_cursor_use_default_mapping=0
" Do not loose all cursors when escaping from insert mode
" let g:multi_cursor_exit_from_insert_mode=0
" Do not loos all cursors when escaping from visual mode
" let g:multi_cursor_exit_from_visual_mode=0
" Turns selection into cursors with Ctrl-m
" nnoremap <silent> <C-m> :MultipleCursorsFind <C-R>/<CR>
" vnoremap <silent> <C-m> :MultipleCursorsFind <C-R>/<CR>
" Change key mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

" }}}
" NERDTREE {{{

" Toggle NERDtree
noremap <Leader>t :NERDTreeToggle<CR>
" Open NERDtree if no file is specified when launching vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if NERDtree is the only open window
autocmd bufenter * if (winnr("$") == 1
    \ && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" }}}
" GIT-GUTTER {{{

set updatetime=250              " Update signs quicker
" Remap hunk movements
nmap )h <Plug>GitGutterNextHunk
nmap (h <Plug>GitGutterPrevHunk
" Remap hunk text-objects
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
" Remap hunk stage and revert
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
" Remap preview hunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
" Toggle line highlights
nmap <Leader>ht :GitGutterLineHighlightsToggle<CR>

" }}}
" FUGITIVE {{{

" Shortcut to Gstatus
nnoremap <Leader>gs :Gstatus<CR>
" Shortcut to Gpush
nnoremap <Leader>gp :Gpush<CR>

" }}}
" SIMPYLFOLD {{{

" Do not fold doc string
let g:SimpylFold_fold_docstring = 0
" Enable preview of docstring
let g:SimpylFold_docstring_preview = 1
" Do not fold imports
let g:SimpylFold_fold_import = 0
" Fix a bug in certain cases
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" }}}
" AIRLINE {{{

let g:airline_powerline_fonts=1     " Enhanced symbols

" }}}
" NERDCOMMENTER {{{

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comments left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" }}}
" SYNTASTIC {{{

" Syntastic recommended settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Set the height of the location list
let g:syntastic_loc_list_height = 5

" }}}
" JEDI {{{

" Use tabs instead of buffers when going to definition
let g:jedi#use_tabs_not_buffers = 1
" Map go to definition command
let g:jedi#documentation_command = "<Leader>d"
" Show all usages of element under cursor
let g:jedi#usages_command = "<leader>n"
" Disable goto command, default: <leader>d
let g:jedi#goto_command = "<Leader>g"
" Disable goto assignments, default: <leader>g
let g:jedi#goto_assignments_command = ""
let g:jedi#rename_command = "<leader>r"

" }}}
" MARKDOWN {{{

augroup markdown
    " Remove 80 chars delimiter
    autocmd Filetype markdown setlocal colorcolumn=
    autocmd Filetype markdown highlight OverLengthHard NONE
    autocmd Filetype markdown highlight OverLengthSoft NONE
    " Render marked elements inline
    autocmd Filetype markdown set conceallevel=2              
augroup END

" Highlight JSON
let g:vim_markdown_json_frontmatter = 1

" }}}
" LATEX {{{

" Enable folding
let g:vimtex_fold_enabled=1

augroup latex
    " Run Lacheck to check syntax when saving file
    autocmd BufWritePost *.tex :VimtexLacheck
    " Number of spaces per tab
    autocmd Filetype tex set tabstop=2
    " Number of spaces in tab when editing
    autocmd Filetype tex set softtabstop=2           
    " Indent lines by 4 spaces
    autocmd Filetype tex set shiftwidth=2            
augroup END

" }}}
" AUTOCOMMANDS {{{

" Wrapped in augroup to ensure autocmd are applied only once
augroup configgroup
    " Clear all autocmd for the current group
    autocmd!
    " Remove all useless white spaces
    autocmd BufWritePre *.py,*.md,*.txt,*.tex :call StripTrailingWhitespaces()
    " Set comment pattern for Python files
    autocmd Filetype python setlocal commentstring=#\ %s
    " Automatically sources changes in vimrc when file is saved
    autocmd BufWritePost .vimrc,vimrc source % | AirlineRefresh | redraw 
    " Enable full highlighting for Python files
    " autocmd BufRead,BufNewFile *.py let python_highlight_all=1
    " Spell checks Git commits
    autocmd FileType gitcommit setlocal spell
augroup END

" }}}
" CUSTOM FUNCTIONS {{{

" Strip trailing whitespaces.
" This is called on buffer write in the autogroup above.
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Toggles all folds in file
function! ToggleAllFolds()
    if(&foldlevel>0)
        set foldlevel=0
    else
        set foldlevel=99
    endif
endfunction

" }}}

" Configure .vimrc folding (works with modelines)
" vim:foldmethod=marker:foldlevel=0
