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

;無変換単独->IME off(英数)
vk1Dsc07B::IME_SET(0)

;変換単独->IME on(かな切り替え)
vk1Csc079::IME_SET(1)

;無変換+h→左
vk1Dsc07B & h::
if GetKeyState("shift", "P"){
    Send, +{Left}
}else{
    Send,{Left}
}
return

;無変換+j→下
vk1Dsc07B & j::
if GetKeyState("shift", "P"){
    Send, +{Down}
}else{
    Send,{Down}
}
return

;無変換+k→上
vk1Dsc07B & k::
If GetKeyState("shift", "P"){
    Send, +{Up}
}else{
    Send,{Up}
}
return

;無変換+l→右
vk1Dsc07B & l::
If GetKeyState("shift", "P"){
    Send, +{Right}
}else{
    Send,{Right}
}
return

;無変換+y→yank
vk1Dsc07B & y::Send,^c

;無変換+p->paste
vk1Dsc07B & p::Send,^v

;無変換+d->ctrl+x
vk1Dsc07B & d::Send,^x

;無変換+m->ウィンドウ移動
vk1Dsc07B & m::Send,#+{Right}

;無変換+Tab->アプリ移動
vk1Dsc07B & vkBEsc034 :: AltTab
vk1Dsc07B & vkBCsc033 :: ShiftAltTab

;無変換+コロン+シフト->vimで開く
vk1Dsc07B & vkBAsc028 ::
  if GetKeyState("shift", "P"){
      path := Explorer_GetSelection(),
      Send, ^c
      Run, "path/to/vim" "%path%"
  }
return

; エクスプローラで選択中のフォルダ、ファイルパスを取得
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

;無変換 + q→アプリを閉じる(alt + F4)
vk1Dsc07B & q::
    Send,!{F4} 
return


#IfWinActive ahk_class CabinetWClass
;エクスプローラのみ
;無変換+u→1階層上へ
vk1Dsc07B & u::Send,!{Up}
#IfWinActive ahk_class CabinetWClass

