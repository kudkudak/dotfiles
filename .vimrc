"Set up vundle 
"git clone https://github.com/VundleVim/Vundle.vim.git
"~/.vim/bundle/Vundle.vim

"Set up pathogen
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

:let mapleader = ","
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible
set wrap
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Type :BundleList in vim and install all bundles by :BundleInstall
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Plugin 'wombat256.vim'
Bundle 'altercation/vim-colors-solarized'
" Run python install.py --clang-completer in bundle/YouCompleteMe!
" Bundle 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

" Colors
syntax enable
set background=dark
colorscheme wombat256

filetype plugin indent on
call pathogen#infect() 

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

""""""""""""""""""""
"Shortcuts reminder"
""""""""""""""""""""
noremap <Leader>n :<C-U>tabprevious<CR>
noremap <Leader>m :<C-U>tabnext<CR>

",t/,T - tab navigation
"ctrl+V - block selection
",cc,cu uncommenting
" shift, - indent./unindent
" ctrl+space - autocompletion
" ,jklh - windows navigation
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

nmap <silent> <c-s-k> <C-W>k                                                        
nmap <silent> <c-s-j> <C-W>j                                                        
nmap <silent> <c-s-h> <C-W>h                                                        
nmap <silent> <c-s-l> <C-W>l

set splitbelow
set splitright

" Magic to call cppman, works for std 
nmap <S-K> :exec(":!cppman " .expand("<cword>")) <CR><CR>

autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clang++-3.6 -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" "Max out the height of the current split
" "ctrl + w _
" ""Max out the width of the current split
" ctrl + w |
" "Normalize all split sizes, which is very handy when resizing terminal
" "ctrl + w =
" ""Swap top/bottom or left/right split
" Ctrl+W R
" "Break out current window into a new tabview
" "Ctrl+W T
" ""Close every window in the current tabview but the current one
" Ctrl+W o
" "c
