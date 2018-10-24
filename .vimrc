syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
set hls
set cindent
set autoindent
set smartindent
colorscheme molokai

let mapleader="\<Space>"
nnoremap <leader>q :q<CR>
nnoremap <leader>fw :w<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>fo :e 
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>wh <C-W>h
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wl <C-W>l

nnoremap <leader>r :call Run()<CR>

func! Run()
	exec "w"
	if &filetype == 'c'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python %'
	elseif &filetype == 'sh'
		exec '!time bash %'
	endif
endfunc

nnoremap <leader>gr :call VimGrep()<CR>
nnoremap <leader>cc :cclose<CR>

func! VimGrep()
	exec "vimgrep /\\\<".expand('<cword>')."\\\>/ **"
	exec 'cw'
endfunc

nnoremap <leader>tt :bo term++rows=15<CR>
tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>:quit!<CR>

" ----------------------------- Vundle Start -----------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bufexplorer.zip'
call vundle#end()
filetype plugin indent on
" ----------------------------- Vundle End   -----------------------------

"ycm
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_show_diagnostics_ui=0
let g:ycm_seed_identifiers_with_syntax=1
set completeopt-=preview
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

"bufexplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'

"tagbar
nnoremap <leader>tb :TagbarToggle<CR>

"nerdtree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
