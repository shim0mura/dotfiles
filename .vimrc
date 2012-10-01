" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"customed vim rc
" referenced http://archiva.jp/web/tool/vimrc.html
set nocompatible
set tags=~/.tags
set lcs=tab:>-,eol:-

filetype off

set runtimepath+=~/.bundle/neobundle.vim
call neobundle#rc(expand('~/.bundle'))

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/twipass-vim.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/glidenote/memolist.vim.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/ervandew/supertab.git'
NeoBundle 'surround.vim'
NeoBundle 'matchit.vim'
NeoBundle 'ruby-matchit'
NeoBundle 'srcexpl.vim'
NeoBundle 'trinity.vim'
NeoBundle 'NERD_tree.vim'
NeoBundle 'taglist.vim'
NeoBundle 'Javascript-syntax'
NeoBundle 'TwitVim'
NeoBundle 'sudo.vim'

filetype plugin on
filetype indent on


" display
" ----------------------
set number
set ruler
set scrolloff=7
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set wildmenu
set wildmode=list:longest
set showcmd
set list
set lcs=tab:>-
" ウィンドウサイズの自動調整
set noequalalways
set ambiwidth=double
"set textwidth=78
"set columns=100
"set lines=150
"
set splitbelow
set splitright

" for Japanese in gvim
set noimdisable
set noimcmdline
set iminsert=1
set imsearch=1

" view
" ---------------------
set showcmd
set showmode
set cursorline


" syntax color
" ---------------------
set t_Co=256
syntax on
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm
colorscheme torte
highlight LineNr ctermfg=darkgray
highlight CursorLine ctermbg=darkblue


" search
" ----------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch


" edit
" ---------------------
set autoindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set guioptions+=a
set pastetoggle=<F12>
set mouse=a
set ttymouse=xterm2


" tab
" --------------------
set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set shiftround
"set nowrap


" backup
" --------------------
set backup
set backupdir=~/vim_backup
set swapfile
set directory=~/vim_swap


" keymaps
" --------------------

" paste clipboad in insert mode
imap <C-K>  <ESC>"*pa

" type command easily
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>r :<C-u>source $MYVIMRC<CR>
nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>h :help<space>
nnoremap <Space>n :<C-u>new<space><Return>
nnoremap <Space>v :<C-u>vnew<space><Return>

" insert time
nnoremap <Space>t :<C-u>r!<space>date<space>"+\%H:\%M"<space><Return>


" http://vim-users.jp/2009/09/hack74/
" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
                \if has('gui_running') | source $MYGVIMRC  
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

" 行単位での移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


" Setting for Unite.vim
" let g:unite_enable_start_insert=1

" バッファ一覧
nnoremap <silent> ;ub :<C-u>Unite buffer<CR>

" ファイル一覧
nnoremap <silent> ;uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" レジスタ一覧
nnoremap <silent> ;ur :<C-u>Unite -buffer-name=register register<CR>

" 最近使用したファイル一覧
nnoremap <silent> ;um :<C-u>Unite file_mru<CR>

" 常用セット
nnoremap <silent> ;uu :<C-u>Unite buffer file_mru<CR>

" unite outline 
nnoremap <silent> ;uo :<C-u>Unite outline<CR>

" 全部乗せ
nnoremap <silent> ;ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file outline<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" コマンドモードでよくやるやつ
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>


" 挿入モードでの移動
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <left>
inoremap <C-l> <right>


" カーソー固定
nnoremap j gjzz
nnoremap k gkzz


" window操作
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

" 括弧の中身選択
vnoremap ( t(
vnoremap ) t)
vnoremap ] t]
vnoremap [ t[
onoremap ( t(
onoremap ) t)
onoremap ] t]
onoremap [ t[

" 全角スペース氏ね
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/


" rubyのメソッドやクラスをまとめて選択する(b:block用、m:def用、c:class用、M:module用)
nnoremap vab 0/end<CR>%Vn
nnoremap vib 0/end<CR>%kVnj
nnoremap vam $?\%(.*#.*def\)\@!def<CR>%Vn
nnoremap vim $?\%(.*#.*def\)\@!def<CR>%kVnj
nnoremap vac $?\%(.*#.*class\)\@!class<CR>%Vn
nnoremap vic $?\%(.*#.*class\)\@!class<CR>%kVnj
nnoremap vaM $?\%(.*#.*module\)\@!module<CR>%Vn
nnoremap viM $?\%(.*#.*module\)\@!module<CR>%kVnj


" htmlサンショウモに
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
  if a:0 == 0 || a:1 != 0
    inoremap \\ \
    inoremap \& &amp;
    inoremap \< &lt;
    inoremap \> &gt;
    inoremap \. ・
    inoremap \- &#8212;
    inoremap \<Space> &nbsp;
    inoremap \` &#8216;
    inoremap \' &#8217;
    inoremap \2 &#8220;
    inoremap \" &#8221;
    autocmd! BufLeave * call MapHTMLKeys(0)
  else
    iunmap \\
    iunmap \&
    iunmap \<
    iunmap \>
    iunmap \-
    iunmap \<Space>
    iunmap \`
    iunmap \'
    iunmap \2
    iunmap \"
    autocmd! BufLeave *
  endif " test for mapping/unmapping
endfunction " MapHTMLKeys()



" Setting for hatena-vim
" -------------------------------------------
set runtimepath+=$HOME/work/hatena
let g:hatena_user='shim0mura'
au BufRead,BufNewFile *.htn set filetype=hatena


" Setting for twitvim
" -------------------------------------------
"  password管理どうしたらいいんですか....
let twitvim_login = "shim0mura:vimdaisukiloveaisiteru" 


" Setting for vim-powerline
" -------------------------------------------
let g:Powerline_symbols = 'fancy'
set t_Co=256


" Setting for memolist.vim
" -------------------------------------------
let g:memolist_path = "~/work/memo"
nnoremap <silent> ;ml  :MemoList<CR>
nnoremap <silent> ;mn  :MemoNew<CR>
nnoremap <silent> ;mg  :MemoGrep<CR>

" Setting for surround.vim
" -------------------------------------------
"surroundに定義を追加する【ASCIIコードを調べるには:echo char2nr("-")】

" '!' | '-' -> html comment
let g:surround_33 = "<!-- \r -->"
let g:surround_45 = "<!-- \r -->"
" '%' -> erb section
let g:surround_37 = "<% \r %>"
" '#' -> 変数展開
let g:surround_35 = "#{\r}"


" Setting for NERDTree
" -------------------------------------------
"  うごかん...
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter :NERDTree ./
endif
 
" カーソルが外れているときは自動的にnerdtreeを隠す
"function! ExecuteNERDTree()
"    "b:nerdstatus = 1 : NERDTree 表示中
"    "b:nerdstatus = 2 : NERDTree 非表示中
" 
"    if !exists('g:nerdstatus')
"        "execute 'NERDTree ./'
"        let g:windowWidth = winwidth(winnr())
"        let g:nerdtreebuf = bufnr('')
"        let g:nerdstatus = 1 
" 
"    elseif g:nerdstatus == 1 
"        execute 'wincmd t'
"        execute 'vertical resize' 0 
"        execute 'wincmd p'
"        let g:nerdstatus = 2 
"    elseif g:nerdstatus == 2 
"        execute 'wincmd t'
"        execute 'vertical resize' g:windowWidth
"        let g:nerdstatus = 1 
"    endif
"endfunction
"noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
"</cr></c-u></c-e>


" Setting for neocomplcache
" -------------------------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Setting for openbrowser
" -------------------------------------------
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" command memo
" ファイルを指定の文字コードで開き直す
" :e ++enc=utf-8
"
"
