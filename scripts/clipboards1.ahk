#Persistent

; Hotkeys
; <+>+q::Copy(1)
; <+>+w::Paste(1)

; <+>+a::Copy(2)
; <+>+s::Paste(2)

; <+>+z::Copy(3)
; <+>+x::Paste(3)


CapsLock & c::TymonCopy()

CapsLock & 1::Paste(1)
CapsLock & 2::Paste(2)
CapsLock & 3::Paste(3)

CapsLock & v::TymonPaste(0)
CapsLock & f::TymonPaste(1)
CapsLock & d::TymonPaste(2)

TymonCopy2(){
	if(ClipboardData2)
	{
		ClipboardData3 := ClipboardData2
		SendInput, chuj
		return
	}
	if(ClipboardData1)
	{
		ClipboardData2 := ClipboardData1
		SendInput, chuj
		return
	}
	
	Copy(1)
}

TymonPaste(clipboardInputID){
	
	Sub = %counter% - %clipboardInputId%
	;if( Sub < 1)
	;{
	;	Sub += 3
	;}
	;Paste(%Sub%)
	SendInput, %counter%
	if !counter
	{
		SendInput, CHUJCHUJ
	}

}



TymonCopy()
{
	global
	if !counter
	{
		counter := 1
	}
	if counter
	{
		Copy(counter)
		counter := counter + 1

		if (counter > 4)
		{
			counter :=1
		}
		
	}
}


Copy(clipboardID)
{
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

Cut(clipboardID)
{
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

Paste(clipboardID)
{
	global
	local oldClipboard := ClipboardAll ; Save the (real) clipboard

	Clipboard := ClipboardData%clipboardID%
	Send ^v

	Clipboard := oldClipboard ; Restore old (real) clipboard
	oldClipboard = 
}