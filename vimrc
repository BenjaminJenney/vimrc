syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set smarttab

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen
    set t_ut=
endif

set t_Co=256

function! BuildYCM(info)  
  " info is a dictionary with 3 fields  
  " - name:   name of the plugin  
  " - status: 'installed', 'updated', or 'unchanged'  
  " - force:  set on PlugInstall! or PlugUpdate!  
  if a:info.status == 'installed' || a:info.force  
    !./install.py  
  endif  
endfunction 

"for nerd commenter
"
filetype plugin on
"
"
function Splitresize()
    let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
    exe "vertical resize" . (min([hmax, 140]))
    exe "resize" . (min([vmax, 60]))
endfunction
"#####PLUGINS#######
"###################

call plug#begin('~/.vim/plugged')
    Plug 'dense-analysis/ale'
    Plug 'Valloric/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs'
    Plug '907th/vim-auto-save'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ErichDonGubler/vim-sublime-monokai'
    Plug 'preservim/nerdcommenter'
    Plug 'pangloss/vim-javascript'
call plug#end()


"###################
"###################
"##################
"#PLUGIN SETTINGS##
"##################
"autocmd vimenter * colorscheme gruvbox
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

"set bg=dark
"################
"mappings
"################

" move between splits without the ctrl-w prefix
nnoremap <silent><C-J> <C-W><C-J>:call Splitresize()<CR>
nnoremap <silent><C-K> <C-W><C-K>:call Splitresize()<CR>
nnoremap <silent><C-L> <C-W><C-L>:call Splitresize()<CR>
nnoremap <silent><C-H> <C-W><C-H>:call Splitresize()<CR>

" moving between buffers ctrl-j ctrl-k
nnoremap <C-j> :bprev<CR>                                                                            
nnoremap <C-k> :bnext<CR>
" quick escape (go to normal mode)
inoremap jj <ESC>

"################
"EXTRAS
"################
set termguicolors
set t_Co=256
"autocmd vimenter * bo term
"autocmd vimenter * resize 30
"autocmd vimenter * mouse a
syntax on
colorscheme sublimemonokai
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
