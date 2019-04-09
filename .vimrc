" syntax ON
syntax on;
" neobundle設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'

" windows用のvimprocのdllを持ってくる
" let g:vimproc#download_windows_dll = 1

" 以下は必要に応じて追加
" ファイル移動とか
NeoBundle 'Shougo/unite.vim'
" unite file_mruがなんか分離したらしい
NeoBundle 'Shougo/neomru.vim'
" 自動補完
NeoBundle 'Shougo/neosnippet.vim'
" 自動補完(辞書)
NeoBundle 'Shougo/neosnippet-snippets'
" 自動補完
NeoBundle 'Shougo/neocomplete.vim'
" emmet
NeoBundle 'mattn/emmet-vim'
" git使うやつ
NeoBundle 'tpope/vim-fugitive'
" rails使うやつ
NeoBundle 'tpope/vim-rails'
" rubyでendを自動挿入してくれるやつ
NeoBundle 'tpope/vim-endwise'
" ステータスラインの色変えるやつ
NeoBundle 'itchyny/lightline.vim'
" ビジュアルモードでコメントアウトやつ(選択してctr+_を二回 or gcc)
NeoBundle 'tomtom/tcomment_vim'
" HTML5のタグ用のsyntax
NeoBundle 'othree/html5.vim'
" CSS3用のsyntax
NeoBundle 'hail2u/vim-css3-syntax'
" javaScript用のsyntax
"NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
" jsx用syntax
NeoBundle 'mxw/vim-jsx'
" vue用syntax
NeoBundle 'posva/vim-vue'
" laravel, blade用のsyntax
NeoBundle 'jwalton512/vim-blade'
" julia用のsyntax
NeoBundle 'JuliaEditorSupport/julia-vim'
" elixir用のsyntax
NeoBundle 'elixir-lang/vim-elixir'
" kotlin用のsyntax
NeoBundle 'udalov/kotlin-vim'
" markdown用のsyntaxとかいろいろ
NeoBundle 'plasticboy/vim-markdown'
" markdownをブラウザでプレビューするやつ。PrevimOpen
NeoBundle 'kannokanno/previm'
" ブラウザ開くやつ。previmだけでもいいが設定めんどいので
NeoBundle 'tyru/open-browser.vim'
" 選択範囲のdiff, 選択して:Linediffを二回
NeoBundle 'AndrewRadev/linediff.vim'
" todo.txt用のsyntaxと、コマンド追加 円マーク+sとかxとかdとかDとかdate+<tab>とか。:h todo.txt
NeoBundle 'freitass/todo.txt-vim'
" 日記作る時用。新規ディレクトリ内のファイル保存するときにディレクトリを作成
NeoBundle 'mopp/autodirmake.vim'
" twig用syntax
NeoBundle 'evidens/vim-twig'
" ソースのクイック実行+出力
NeoBundle 'thinca/vim-quickrun'
" 汎用的なquickrun-hookまとめ
NeoBundle "osyo-manga/shabadou.vim"
" 非同期実行を可能に
" NeoBundle 'Shougo/vimproc'
"            \ , {
"            \ 'build' : {
"            \   'windows' : 'tools\\update-dll-mingw.bat',
"            \   'cygwin'  : 'make -f make_cygwin.mak',
"            \   'mac'     : 'make -f make_mac.mak',
"            \   'linux'   : 'make',
"            \   'unix'    : 'gmake',
"            \ },
"            \}

" カラースキーム
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'tomasr/molokai'
NeoBundle 'KKPMW/moonshine-vim'
NeoBundle 'jacoborus/tender.vim'

call neobundle#end()

filetype plugin indent on

" .mdもマークダウン形式のファイルだよ。
au BufRead,BufNewFile *.md set filetype=markdown
" .vueはHTML形式のファイルだよ。
" au BufRead,BufNewFile *.vue set filetype=html
" .vueはsyntax判断をファイルの先頭から行う。
" => 500行前まで検索に変更
autocmd FileType vue,jsx syntax sync minlines=500 maxlines=1000

" PrevimOpenで開くブラウザ指定
" let g:previm_open_cmd = 'start chrome'
" vim-markdownが勝手にfolding(折り畳み)してくるの対策
let g:vim_markdown_folding_disabled = 1

" jsx用syntaxをjsにも有効にする
let g:jsx_ext_required = 0

" ここからsetting
" 検索結果ハイライト
set hlsearch
" ファイルフォーマットはunix(改行コード対策)
set ff=unix
" カラースキームはmolokaiにする
" colorscheme moonshine
colorscheme tender
" ダーク系のカラースキームを使用
"set background=dark
" 文字コード指定
set enc=utf-8
set fenc=utf-8
" 編集中ファイルが変更されたら自動で再読み込み
set autoread
" 入力中コマンドを表示
set showcmd
" コマンドライン補完
set wildmode=list:longest,full
" 行番号表示
set number
" 現在の行を強調表示
"  set cursorline
set nocursorline
" 現在の列を強調表示
"  set cursorcolumn
set nocursorcolumn
" ビープ音を可視化
set visualbell
" 対応する括弧表示
set showmatch

" タブ幅を2にする
set tabstop=2
" 行頭タブ幅も2にする
set shiftwidth=2
" 行頭スペースをタブ扱いする
  set expandtab
"  ↑しない
"set noexpandtab
" undofile作成しない。
set noundofile
" バックアップファイルも作成しない。
set nobackup
" 初期保存先を指定
set browsedir=buffer
" Windowsで"/"有効化
set shellslash
" 自動的にディレクトリ移動
set autochdir
"ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
"ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 行番号の色
highlight LineNr ctermfg=darkyellow

"全角スペースをハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif


" lightline設定
let g:lightline = {
			\ 'colorscheme': 'tender',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'modified': 'LightlineModified',
			\   'readonly': 'LightlineReadonly',
			\   'fugitive': 'LightlineFugitive',
			\   'filename': 'LightlineFilename',
			\   'fileformat': 'LightlineFileformat',
			\   'filetype': 'LightlineFiletype',
			\   'fileencoding': 'LightlineFileencoding',
			\   'mode': 'LightlineMode'
			\ }
			\ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
		return fugitive#head()
	else
		return ''
	endif
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" quickrunの設定
" if !exists('g:quickrun_config'
"     let g:quickrun_config = {}
" endif
" 
" let g:quickrun_config['_'] = {
" \ 'runner'                                 : 'vimproc',
" \ 'runner/vimproc/updatetime'              : 50,
" \ 'outputter'                              : 'multi:buffer:quickfix',
" \ 'outputter/buffer/split'                 : 'botright 8sp',
" \ 'hook/close_quickfix/enable_hook_loaded' : 1,
" \ 'hook/close_quickfix/enable_success'     : 1,
" \ 'hook/close_buffer/enable_failure'       : 1,
" \}
" 
" " *Test.phpのファイルタイプを、phpかつphpunitとして認識
" augroup MyVimrc
"     autocmd!
" augroup END
" autocmd MyVimrc BufNewFile,BufRead *Test.php setlocal ft=php.phpunit
" 
" " ファイルタイプphp.phpunitのquickrun設定
" let g:quickrun_config['php.phpunit'] = {
" \ 'hook/cd/directory'              : '%S:p:h',
" \ 'command'                        : 'phpunit.sh',
" \ 'cmdopt'                         : '',
" \ 'exec'                           : '%c %o %s',
" \ 'outputter/quickfix/errorformat' : '%f:%l,%m in %f on line %l',
" \}
