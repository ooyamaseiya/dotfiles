let mapleader = "\<space>"
" setting
"Deleteキーで文字削除
noremap! <C-?> <C-h>
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn

hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine
hi MatchParen ctermbg=1

" Visualモードで文字がなくても右に進める
set virtualedit=block
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" jjでインサートモードから抜ける
inoremap <silent> jj <ESC>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" カラースキーマ
colorscheme iceberg

" *************************************************************
" Vundleプラグインマネージャ
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'sheerun/vim-polyglot'
Plugin 'mattn/emmet-vim'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

call vundle#end()            " required
filetype plugin indent on    " required

" ************************************************************
call plug#begin('~/.vim/plugged')

" Initialize plugin system
call plug#end()

 " vim-easymotion plugin
map <Leader>s <Plug>(easymotion-bd-f2)
let g:EasyMotion_prompt = ''

" nerdcommenter plugin
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
xmap gc  <Plug>VSCodeCommentary

" AirLineテーマ
let g:airline_theme='simple'
" タブの有効化
let g:airline#extensions#tabline#enabled = 1

" インデントガイドを起動時から有効にする
let g:indent_guides_enable_on_vim_startup = 1
" インデントガイドのサイズ
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#161821   ctermbg=234
