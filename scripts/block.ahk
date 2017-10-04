
LShift & F12::BlockInput, On

~LAlt up::
	DoUnlock := false
	return
	
~RAlt up::
	DoUnlock := false
	return

LAlt & RAlt::BlockInput, Off

!^Delete::DllCall("LockWorkStation")
!^NumpadDot::DllCall("LockWorkStation")
!^NumpadDel::DllCall("LockWorkStation")
