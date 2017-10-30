"colorscheme evening
set columns=200
set lines=125

set guifont=HGゴシックM:h14:cSHIFTJIS

" スペースを挿入
nnoremap <C-Space> i <Esc><Right>

" normal モードで改行
nnoremap <C-j> O<Esc><Down>

" カーソル位置の単語をヤンクした単語に置換
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap gy "0P

