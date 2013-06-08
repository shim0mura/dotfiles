" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Source local customize
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"customed vim rc
" referenced http://archiva.jp/web/tool/vimrc.html
set nocompatible
set tags=~/.tags

filetype off

set runtimepath+=~/.bundle/neobundle.vim
call neobundle#rc(expand('~/.bundle'))

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/twipass-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/vimplenote-vim.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/glidenote/memolist.vim.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/motemen/git-vim.git'
NeoBundle 'git://github.com/ervandew/supertab.git'
"NeoBundle 'git://github.com/kana/vim-tabpagecd.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/tmhedberg/matchit.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/tomasr/molokai.git'
NeoBundle 'git://github.com/jnurmine/Zenburn.git'
NeoBundle 'git://github.com/sgur/ctrlp-extensions.vim.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/skwp/vim-rspec.git'
NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'

NeoBundle 'surround.vim'
"NeoBundle 'matchit.vim'
NeoBundle 'ruby-matchit'
NeoBundle 'trinity.vim'
NeoBundle 'jellybeans.vim'
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
set noautochdir
set noequalalways
" ウィンドウサイズの自動調整
set ambiwidth=double
"set textwidth=78
"set columns=100
"set lines=150
"

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
set listchars=eol:↲,tab:>. 

" syntax color
" ---------------------
set t_Co=256
syntax on
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
highlight LineNr ctermfg=darkgray
highlight CursorLine ctermbg=white


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
set clipboard+=unnamed,autoselect
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

" copy to clipboard in ubuntu
vnoremap y "+y
nnoremap y y
nnoremap yy "+yy

" type command easily
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>r :<C-u>source $MYVIMRC<CR>
nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>h :help<space>
nnoremap <Space>n :<C-u>new<Return>
nnoremap <Space>v :<C-u>vnew<Return>

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


" tab motion
nnoremap <C-L> :<c-u>tabnext<cr>
nnoremap <C-H> :<c-u>tabprevious<cr>
nnoremap <F2> :<c-u>tabnew<cr>

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


" setting for rspec
nnoremap <silent> ;rs :RunSpec<CR>
nnoremap <silent> ;rl :RunSpecLine<CR>


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

" 括弧の中身選択
vnoremap ( t(
vnoremap ) t)
vnoremap ] t]
vnoremap [ t[
onoremap ( t(
onoremap ) t)
onoremap ] t]
onoremap [ t[

" rubyのメソッドやクラスをまとめて選択する(b:block用、m:def用、c:class用、M:module用)
nnoremap vab 0/\<end\><CR>%Vn
nnoremap vib 0/\<end\><CR>%kVnj
nnoremap vam $?\%(.*#.*def\)\@!def<CR>%Vn
nnoremap vim $?\%(.*#.*def\)\@!def<CR>%kVnj
nnoremap vac $?\%(.*#.*class\)\@!class<CR>%Vn
nnoremap vic $?\%(.*#.*class\)\@!class<CR>%kVnj
nnoremap vaM $?\%(.*#.*module\)\@!module<CR>%Vn
nnoremap viM $?\%(.*#.*module\)\@!module<CR>%kVnj


" タブに番号付ける
" http://doruby.kbmj.com/aisi/20091218/Vim__
function! GuiTabLabel()
  let l:label = ''

  let l:bufnrlist = tabpagebuflist(v:lnum)

  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  return l:label
endfunction

set guitablabel=%N:\ %{GuiTabLabel()}


" tabのディレクトリ管理をタブ単位で行う
" http://labs.timedia.co.jp/2012/05/vim-tabpagecd.html
augroup plugin-tabpagecd
  autocmd!

  autocmd TabEnter *
  \   if exists('t:cwd')
  \ |   cd `=fnameescape(t:cwd)`
  \ | endif

  autocmd TabLeave *
  \   let t:cwd = getcwd()
augroup END


" html参照文字
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


" Setting for vim-powerline
" -------------------------------------------
let g:Powerline_symbols = 'fancy'


" Setting for memolist.vim
" -------------------------------------------
let g:memolist_path = "~/Dropbox/memo"
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
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * :NERDTree ./
endif


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


" Setting for easymotion
" -------------------------------------------
" ホームポジションに近いキーを使う
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = '<Space><Space>'
let g:EasyMotion_grouping = 1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" Setting for vimplenote
" -------------------------------------------
nnoremap <silent> ;sl  :VimpleNote -l<CR>
nnoremap <silent> ;su  :VimpleNote -u<CR>
nnoremap <silent> ;sn  :VimpleNote -n<CR>


" Setting for ctrlp
" -------------------------------------------
let g:ctrlp_working_path_mode = "rw"
let g:ctrlp_highlight_match = [1, 'IncSearch']
let g:ctrlp_extensions = ['cmdline', 'yankring', 'menu']
let g:ctrlp_jump_to_buffer = 2


" command memo
" ファイルを指定の文字コードで開き直す
" :e ++enc=utf-8
"
" ファイルの文字コード変換
" :setl fenc=utf8 "(or euc-jp or sjis etc...)
"
" ファイルの改行コード変換
" :setl ff=dos "(or unix or mac)
"
"

