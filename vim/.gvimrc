"colorscheme evening
set columns=200
set lines=125

set guifont=HG�S�V�b�NM:h14:cSHIFTJIS

" �X�y�[�X��}��
nnoremap <C-Space> i <Esc><Right>

" normal ���[�h�ŉ��s
nnoremap <C-j> O<Esc><Down>

" �J�[�\���ʒu�̒P��������N�����P��ɒu��
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap gy "0P

