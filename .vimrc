"NiKo ViM.rc"


"-GENERAL----------------------------------------------------------------------

set backspace=2     "enable backspace to delete anyting (includes \n) in insert mode
set nocompatible    "we don't care about vi
set showmatch       "show matching bracket/parenthesis
set ai              "autoindenting (local to buffer)
set si              "smartindenting (clever autoindenting)
set tabstop=2       "number of spaces the tab stands for
set shiftwidth=2    "number of spaces used for (auto)indenting
"set smarttab        "a <tab> in an indent insets 'shiftwidth' spaces (not tabstop)
set softtabstop=2   "if non-zero, number of spaces to insert for a <tab>
set expandtab
"set cindent         "enable specific indenting for c-code and others
"set cinoptions={.5s,+.5s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set complete=.,u,b,t,w
"set tw=0            "now real wrap during insert (enable/override this when using as mail-editor)
set formatoptions=tcrqn2 " use full featured format-options. see "help fo-table for help
"set com&            "reset to default what are comments
"set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///
set ignorecase      "select case-insenitive search
set scs             "no ignorecase if Uppercase chars in search
set magic           "change the way backslashes are used in search patterns
set wrapscan        "begin search at top when EOF reached
set sm              "jump to matches during entering the pattern
set hls             "highlight all matches...
set incsearch       " ...and also during entering the pattern
set gdefault        "use 'g'-flag when substituting
set noedcompatible  "turn off the fucking :s///gc toggling
set mousef          "focus follows mouse
set wh=1            "minimal number of lines used for the current window
set wmh=0           "minimal number of lines used for any window
set noequalalways   "make all windows the same size when adding/removing windows
set splitbelow      "a new window is put below the current one
set uc=50           "number of characters typed to cause a swap file update
set nobackup        "make no backups
set directory=/var/tmp "change swap file directory
set cursorline      "highlight current line
set splitbelow      "open new file in bottom instead on :sp
set splitright      "open new file in right instead on :vsp
set clipboard=unnamedplus "synchronize unnamed register (") with clipboard register (+)

call pathogen#infect()
syntax on
set bg=dark         "background kind
filetype plugin indent on
"if has("gui_running")
    "set gfn=-adobe-courier-medium-r-normal-*-*-140-*-*-m-*-iso8859-15
    "set gfn=Courier\ New\ 12
    "colorscheme morning
"else
	colorscheme niko-dark
"endif
"
"-STATUS/MENU------------------------------------------------------------------

set wc=<TAB>       "use tab for auto-expansion in menus
set wmnu           "show a list of all matches when tabbing a command
set wildmode=list:longest,list:full "how command line completion works
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz "ignore some files for filename completion
set su=.h,.bak,~,.o,.info,.swp,.obj "some filetypes got lower priority
set hi=256         "remember last 2000 typed commands
set ruler          "show cursor position below each window
set ru
set showmode       "shows the current status (insert, visual, ...) in statusline
"set shm=a          "use shortest messages
set laststatus=2   "show always statusline of last window

" - CLOJURE
"" Paredit
let g:paredit_mode = 1
let g:clojure_maxlines = 200
let g:clojure_fuzzy_indent = 1
let g:clojure_align_multiline_strings = 1

let g:clojure_conceal_extras = 1

au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"-SHORCUTS---------------------------------------------------------------------

let mapleader = ","

"CTRL-T,N is rew tab
noremap <C-t>n :tabnew<CR>
inoremap <C-t>n <Esc>:tabnew<CR>
nnoremap <C-t>n :tabnew<CR>
"CTRL-T,H is first tab
noremap <C-t>h :tabfirst<CR>
inoremap <C-t>h <Esc>:tabfirst<CR>
nnoremap <C-t>h :tabfirst<CR>
"CTRL-T,J is prev tab
noremap <C-t>j :tabprevious<CR>
inoremap <C-t>j <Esc>:tabprevious<CR>
nnoremap <C-t>j :tabprevious<CR>
"CTRL-T,K is next tab
noremap <C-t>k :tabnext<CR>
inoremap <C-t>k <Esc>:tabnext<CR>
nnoremap <C-t>k :tabnext<CR>
"CTRL-T,L is last tab
noremap <C-t>l :tablast<CR>
inoremap <C-t>l <Esc>:tablast<CR>
nnoremap <C-t>l :tablast<CR>

"search in doc selected text
vnoremap * <Esc>:let save_reg=@"<CR>gvy:let @/=@"<CR>:let @"=save_reg<CR>/<CR>

"toggle line numbers
noremap <F2>  :if 1 == &nu \| set nonu \| else \| set nu \| endif \| <CR>

"json tidy (requires cpan JSON::XS)
inoremap <F3> <Esc>:%!json_xs<CR>:%retab!<CR>
nnoremap <F3> :%!json_xs<CR>:%retab!<CR>
"inoremap <F3> <Esc>:%!json_xs -f json -t json-pretty<CR>:%retab!<CR>
"nnoremap <F3> :%!json_xs -f json -t json-pretty<CR>:%retab!<CR>

"toggle highlight search
noremap <F4>  :if 1 == &hls \| noh \| else \| set hls \| endif \| <CR>

"sudo write
cmap w!! %!sudo tee > /dev/null %

"NERDTree
noremap <F5> :NERDTree<CR>
vnoremap <F5> <Esc>:NERDTree<CR>

