set nocompatible              " be iMproved, required

filetype plugin indent on    " required

" ustawienia tabulacji
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" wciecia i numerowanie
set hidden " nie wymagaj zapisu gdy przechodzisz do nowego bufora
set number " ustaw numerki
set autoindent " automatyczne wciÄ�cia
set mouse=a    " myszka w konsoli
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin()
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'kassio/neoterm'
  Plug 'michalbachowski/vim-wombat256mod'
  Plug 'rking/ag.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'fntlnz/atags.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'drmingdrmer/xptemplate'
  Plug 'scrooloose/nerdtree'
  Plug 'dyng/ctrlsf.vim'
call plug#end()

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> <C-Insert> y:call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> <Insert> :call ClipboardPaste()<cr>p

" set guifont=Monospace\ 13
set completeopt=longest,menuone

" Move to the next buffer
nmap <C-l> :bnext<CR>

" Move to the previous buffer
nmap <C-h> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <F10> :bp <BAR> bd #<CR>

" FZF
map <C-p> <Esc>:FZF<CR>

" atags.vim

map <S-F2> :call atags#generate()<cr>
" autocmd BufWritePost * call atags#generate()

" colorscheme
colorscheme wombat256mod

" xptemplate
let g:xptemplate_key = '<Tab>'

" nerd tree toggle
map <F12> :NERDTreeToggle<CR>

" neoterm
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'

" nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" Airline conf
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'

inoremap <C-Space> <C-x><C-o>
