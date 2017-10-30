;IME
IME_SET(setSts, WinTitle="")
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
	WinGet,hWnd,ID,%WinTitle%
	DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

	;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
	DetectSave := A_DetectHiddenWindows
	DetectHiddenWindows,ON
	SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%
	DetectHiddenWindows,%DetectSave%
	Return ErrorLevel
}

;���ϊ��P��->IME off(�p��)
vk1Dsc07B::IME_SET(0)

;�ϊ��P��->IME on(���Ȑ؂�ւ�)
vk1Csc079::IME_SET(1)

;���ϊ�+h����
vk1Dsc07B & h::
if GetKeyState("shift", "P"){
    Send, +{Left}
}else{
    Send,{Left}
}
return

;���ϊ�+j����
vk1Dsc07B & j::
if GetKeyState("shift", "P"){
    Send, +{Down}
}else{
    Send,{Down}
}
return

;���ϊ�+k����
vk1Dsc07B & k::
If GetKeyState("shift", "P"){
    Send, +{Up}
}else{
    Send,{Up}
}
return

;���ϊ�+l���E
vk1Dsc07B & l::
If GetKeyState("shift", "P"){
    Send, +{Right}
}else{
    Send,{Right}
}
return

;���ϊ�+y��yank
vk1Dsc07B & y::Send,^c

;���ϊ�+p->paste
vk1Dsc07B & p::Send,^v

;���ϊ�+d->ctrl+x
vk1Dsc07B & d::Send,^x

;���ϊ�+m->�E�B���h�E�ړ�
vk1Dsc07B & m::Send,#+{Right}

;���ϊ�+Tab->�A�v���ړ�
vk1Dsc07B & vkBEsc034 :: AltTab
vk1Dsc07B & vkBCsc033 :: ShiftAltTab

;���ϊ�+�R����+�V�t�g->vim�ŊJ��
vk1Dsc07B & vkBAsc028 ::
  if GetKeyState("shift", "P"){
      path := Explorer_GetSelection(),
      Send, ^c
      Run, "path/to/vim" "%path%"
  }
return

; �G�N�X�v���[���őI�𒆂̃t�H���_�A�t�@�C���p�X���擾
Explorer_GetSelection(hwnd="") {
	hwnd := hwnd ? hwnd : WinExist("A")
	WinGetClass class, ahk_id %hwnd%
	if (class="CabinetWClass" or class="ExploreWClass" or class="Progman")
		for window in ComObjCreate("Shell.Application").Windows
			if (window.hwnd==hwnd)
    sel := window.Document.SelectedItems
	for item in sel
	ToReturn .= item.path "`n"
	return Trim(ToReturn,"`n")
}

;���ϊ� + q���A�v�������(alt + F4)
vk1Dsc07B & q::
    Send,!{F4} 
return


#IfWinActive ahk_class CabinetWClass
;�G�N�X�v���[���̂�
;���ϊ�+u��1�K�w���
vk1Dsc07B & u::Send,!{Up}
#IfWinActive ahk_class CabinetWClass

