if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" neobundle.vim自身をneobundle.vimで管理する
NeoBundleFetch 'Shougo/neobundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""
" ここにインストールしたいプラグインの設定を書く
"   :help  neobundle-examples
"""""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/vim-jp/vimdoc-ja
NeoBundle 'vim-jp/vimdoc-ja'

" https://github.com/vim-scripts/taglist.vim
NeoBundle 'vim-scripts/taglist.vim'

" https://github.com/majutsushi/tagbar
" NetBundle 'majutsushi/tagbar'

call neobundle#end()

filetype plugin indent on
" プラグインがインストールされているかチェック
NeoBundleCheck

if !has('vim_starting')
	" .vimrcを読み込み直したときのための設定
	call netbundle#call_hook('on_source')
endif

:colorscheme koehler

" viとの互換モード off
" set nocompatible

" backspaceの動きstartから,改行も削除,indentも削除
set backspace=start,eol,indent
" カーソルキーで先頭から前行末へ、行末から次行頭へ
set whichwrap=b,s,[,],<,>,~
" マウスとの連動 off
set mouse=
" シンタックスハイライト on
syntax on
" サーチ時はハイライト off
set nohlsearch
" バックグラウンドが黒のときの設定
highlight StatusLine ctermfg=black ctermbg=grey
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE
" 常にステータスラインを表示
set laststatus=2
" ステータスラインで長いパスでファイル名を表示
set statusline=%F%r%h%=
" 行番号を表示
set number
" インクリメンタル検索 on
set incsearch
" 大文字と小文字を区別せずに検索
set ignorecase
" コマンドラインモードでの補完表示の形式
set wildmenu wildmode=list:full
" カーソルの高速移動
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
" 複数ファイル編集時、次のファイルに移動するショートカット
nmap <silent> <C-n>     :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
" ファイルタイプ
" filetype plugin indent on
syntax enable
" ファイル内の <tab> が対応する空白の数
:set tabstop=4
" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数
:set softtabstop=4
" インデントの各段階に使われる空白の数
:set shiftwidth=4
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う
:set noexpandtab
" オートインデント
:set autoindent
" 折り返し (有効:wrap/無効:nowrap)
:set wrap
" 閉じカッコが入力されたとき、わずかの間、対応するカッコにジャンプする
" (有効:showmatch/無効:noshowmatch)
:set noshowmatch
" たやすく .vimrc を編集する
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
" netrwを開きIDE風に配置する設定
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

function! ToggleVExplorer()
	if !exists("t:netrw_bufnr")
		exec '1wincmd w'
		25Vexplore
		let t:netrw_bufnr = bufnr("%")
		return
	endif
	let win = bufwinnr(t:netrw_bufnr)
	if win != -1
		let cur = winnr()
		exe win . 'wincmd w'
		close
		exe 'wincmd p'
	endif
	unlet t:netrw_bufnr
endfunction
map <silent> <leader>e :call ToggleVExplorer()<cr><c-w>p
" taglistを右に表示する設定
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <silent> <leader>E :TlistToggle<cr>
