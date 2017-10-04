x := 1
MsgBox, %x%

SetCapsLockState, alwaysoff

CapsLock & c::CopyPlus()
CapsLock & x::Cut(1)
CapsLock & v::Paste(1)
CapsLock & f::Paste(2)
CapsLock & r::Paste(3)


CopyPlus(){
    x := x + 1
    if( x > 3 ) x := 0
    Copy(%x%)
    MsgBox, %x%
}

Copy(clipboardID){
	global ; All variables are global by default
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^c
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	ClipboardData%clipboardID% := ClipboardAll
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Cut(clipboardID){
	global ; All variables are global by default
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^x
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	ClipboardData%clipboardID% := ClipboardAll
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Paste(clipboardID){
	global
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	Clipboard := ClipboardData%clipboardID%
	Send ^v
	Clipboard := oldClipboard ; Restore old (real) clipboard
	oldClipboard = 
}

