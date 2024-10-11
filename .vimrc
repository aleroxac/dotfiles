" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-surround'
" THEMES
    Plug 'chriskempson/base16-vim'
    Plug 'morhetz/gruvbox'
    Plug 'nanotech/jellybeans.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arcticicestudio/nord-vim'
call plug#end()


set laststatus=2
set nocompatible
set background=dark
set encoding=utf-8
set hidden

set number
if has('nvim')
    set inccommand=split
endif

set mouse=a
set cursorcolumn
set cursorline
set splitright
set nowrap

"set nobackup
"set nowritebackup
"set noswapfile
"set viminfo=""

set foldmethod=indent
set foldminlines=1
set foldnestmax=1
set foldcolumn=1


set showcmd
set smartcase
set showmode
set title


set wildmenu
set wildmode=longest,list,full


set ignorecase
set incsearch
set hlsearch


set ruler
set noeol
set backspace=indent,eol,start
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=3
set autoindent
set colorcolumn=120
set textwidth=120


colorscheme gruvbox
filetype plugin indent on
syntax on
let g:airline_theme='onedark'


"highlight ColorColumn ctermbg=236
"highlight LineNr ctermbg=236 ctermfg=242
"highlight CursorLineNr cterm=bold ctermbg=lightblue ctermfg=232
"highlight Normal ctermbg=234
"highlight Visual cterm=reverse ctermbg=231 ctermfg=161
"highlight FoldColumn cterm=bold ctermfg=cyan ctermbg=232
"highlight Folded cterm=bold ctermfg=232 ctermbg=161


let mapleader="\<space>"
nnoremap <silent> <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <silent> <leader>sv :source ~/.vimrc<cr>
nnoremap <silent> <leader>r :call mappings#cycle_numbering()<cr>
nnoremap <leader>h :nohl<cr>
nnoremap <silent> <leader>m :call ToggleMouse()<cr>

nnoremap <space> za
nnoremap <expr> <c-space> &foldlevel ? 'zM' :'zR'
nnoremap <F3> :call ToggleFoldMethod()<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-b> :NERDTreeToggle<cr>


"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_powerline_fonts=0


function! ToggleFoldMethod() 
    if &foldmethod == 'indent'
        set foldmethod=manual
        normal! zR<cr>
        normal! zE<cr>
        echom 'FoldMethod changed to MANUAL'
    elseif &foldmethod == 'manual'
        set foldmethod=indent
        normal! zM<cr>
        echom 'FoldMethod changed to INDENT'
    endif
endfunction


function! ToggleMouse() 
    if &mouse == 'a'
        set mouse=i
        echom 'Mouse changed to i'
    elseif &mouse == 'i'
        set mouse=a
        echom 'Mouse changed to a'
    endif
endfunction


" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1




let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 6 / 10))
  let height = &lines - 30
  let y = &lines + 20
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
