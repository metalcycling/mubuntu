" Metalcycling's VIM Look
set nohlsearch
set number
set backspace=indent,eol,start
syntax enable
syntax on

colorscheme codedark

filetype plugin on

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set tab size
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Remap 'jump to line' to 'jump to marker' 
nnoremap ' `

" Leader
let mapleader=" "

set timeout
set timeoutlen=250
set ttimeout
set ttimeoutlen=10

" File management
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>qa :qa<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>wa :wa<CR>
nnoremap <silent> <Leader>wq :wq<CR>
nnoremap <silent> <Leader>wqa :wqa<CR>
nnoremap <silent> <Leader>qa :qa<CR>

" Slime configuration 
let g:slime_target='screen'
let g:slime_python_ipython=1
let g:slime_dont_ask_default=1
let g:slime_default_config={ 'sessionname': $STY, 'windowname': 0 }
autocmd BufNewFile,BufRead,BufNew * let b:slime_config=copy(g:slime_default_config)

" IPython-cell configuration
nnoremap <Leader>s :SlimeSend1 ipython<CR>
nnoremap <Leader>d :SlimeSend1 %debug<CR>
nnoremap <Leader>r :IPythonCellRun<CR>
nnoremap <Leader>R :IPythonCellRunTime<CR>
nnoremap <Leader>c :IPythonCellExecuteCell<CR>
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>
nnoremap <Leader>l :IPythonCellClear<CR>
nnoremap <Leader>x :IPythonCellClose<CR>

" Run compilation and run script
nnoremap <silent> <F6> :w<CR>:!clear; bash %;<CR>
nnoremap <silent> <F9> :w<CR>:!clear; bash run.sh;<CR>
nnoremap <silent> <F8> :w<CR>:!clear; python3 %;<CR>
nnoremap <silent> <F7> :w<CR>:!clear; bash ~/run.sh;<CR>
nnoremap <silent> <F5> :e!<CR>

" Folding Options
set foldmethod=manual
set foldnestmax=1
set nofoldenable
set foldlevel=1

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" D2
augroup d2
  autocmd!
  autocmd BufRead,BufNewFile *.d2 set filetype=d2
  autocmd BufWritePre *.d2 !d2 fmt %
augroup END

" Undo persistence
set undofile
set undodir=~/.vim/undodir

" Dockerfile
augroup dockerfile
  autocmd!
  autocmd BufRead,BufNewFile,BufWritePost Dockerfile* setfiletype dockerfile
augroup END
