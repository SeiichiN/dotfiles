"" init.vim

set number		" 行番号表示
set autoindent		" 改行時に自動でインデントする
set tabstop=4		" タブを何文字の空白に変換するか
set shiftwidth=4	" 自動インデント時に入力する空白の数
set expandtab		" タブ入力を空白に変換
set splitright		" 画面を縦分割する際に右に開く
set clipboard=unnamed	" yank した文字列をクリップボードにコピー
set hls			" 検索した文字をハイライトする
"" added by Seiichi Nukayama
set hlsearch
hi Search ctermbg=lightcyan
hi Search ctermfg=black

"" netrw IDE
source ~/.config/nvim/netrw.vim

"" SKK
let skk_jisyo = "~/.skk-jisyo"
let skk_large_jisyo = "~/skk-dic/SKK-JISYO.L"
source ~/.config/nvim/skk.vim
