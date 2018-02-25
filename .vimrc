"------------------------------------------------------------------------------
" Use pathogen package manager
"------------------------------------------------------------------------------
execute pathogen#infect()


"------------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------
filetype plugin indent on       " Detect file types
colorscheme Tomorrow-Night
syntax on                       " turn syntax highlighting on by default
set backupcopy=yes                  " Disable 'safe write' for webpack to catch saves

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"------------------------------------------------------------------------------
" Setting some decent VIM settings for programming
"------------------------------------------------------------------------------
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set number                      " display line numbers
set relativenumber              " display relative line numbers
set cursorline                  " Highlight current line
set hlsearch                    " Highlight search results
set linespace=10
set colorcolumn=80              " Highlight col 80 as a width guide

set splitbelow " Open vertical splits to the right
set splitright " Open horitzontal splits below

" Default tab settings
set tabstop=4                   " num of colums a tab counts for
set expandtab                   " exand tabs into appropriate number of spaces
set shiftwidth=4                " num of columns indented with reindent operators and C-style indention
set softtabstop=4               " num of columns vim uses when hitting the tab key in insert mode
set smarttab

set backupcopy=yes              " used for webpack development and live reloading

" Specfic filetype indentions
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

"------------------------------------------------------------------------------
" Powerline settings
"------------------------------------------------------------------------------
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
let g:airline_powerline_fonts = 1 " use patched powerline font

"------------------------------------------------------------------------------
" Ctrl+P plugin settings
"------------------------------------------------------------------------------
" Open Ctrl+P buggers in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth =100 
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_mruf_max = 1000
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_case_sensitive = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'


"------------------------------------------------------------------------------
" Vim Markdown preview plugin settings
"------------------------------------------------------------------------------
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey = '<C-m>' " Map markdown preview to Ctrl-M
let vim_markdown_preview_github = 0
let vim_markdown_preview_temp_file = 0
let vim_markdown_preview_browser = 'Google Chrome'

"------------------------------------------------------------------------------
" Sytntastic plugin settings
"------------------------------------------------------------------------------
set statusline+=#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



"------------------------------------------------------------------------------
" GitGutter plugin settings
"------------------------------------------------------------------------------
set updatetime=250
"let g:gitgutter_highlight_lines = 1


"------------------------------------------------------------------------------
" AUTOCMD - Only do this part when compiled with support for autocommands.
"------------------------------------------------------------------------------
if has("autocmd")
    "------------------------------------------------------------------------------
    " General
    "------------------------------------------------------------------------------


    "------------------------------------------------------------------------------
    " GIT settings
    "------------------------------------------------------------------------------
    "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

      autocmd Syntax gitcommit setlocal textwidth=74

    "------------------------------------------------------------------------------
    " NERD Tree plugin settings
    "------------------------------------------------------------------------------
    "Open NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    "Open NERDTree automatically if vim opens in a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    "Close vim if the only window open is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif " has("autocmd")
let g:NERDTreeChDirMode=2


"------------------------------------------------------------------------------
" Key Mappings 
"------------------------------------------------------------------------------
" Toggle NERDTree with 'CTRL-n'
map <C-n> :NERDTreeToggle<CR>  
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

" Navigate vim tabs
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
