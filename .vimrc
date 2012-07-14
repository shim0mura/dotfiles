" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"if has("syntax")
"  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

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

set runtimepath+=~/.vim/neobundle.vim
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
NeoBundle 'surround.vim'
NeoBundle 'matchit.vim'
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
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set wildmenu
set showcmd
"set textwidth=78
"set columns=100
"set lines=150

" view
" ---------------------
set showcmd
set showmode
set cursorline

" syntax color
" ---------------------
syntax on
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
vnoremap y "+y

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
" edit .vimrc easily
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>

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
nnoremap <silent> ;ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"
" -------------------------------------------------------------------
" HTML Key Mappings for Typing Character Codes
"
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“   |open curved double quote
" |\"       |&#8221;  |”   |close curved double quote
" |\`       |&#8216;  |‘   |open curved single quote
" |\'       |&#8217;  |’   |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html
"
"
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
let twitvim_login = "shim0mura:vimdaisukilove" 


" Setting for vim-powerline
" -------------------------------------------
let g:Powerline_symbols = 'fancy'
set t_Co=256


" Setting for memolist.vim
" -------------------------------------------
let g:memolist_path = "~/work/memo"


" Setting for NERDTree
" -------------------------------------------
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
