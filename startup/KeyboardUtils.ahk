#NoTrayIcon
#CommentFlag //


// Keep Window on top: Ctrl F1 

	^F1::  Winset, Alwaysontop, , A
	Return


// Change Volume: Shift Numpad+ Shift Numpad-

	<+NumpadAdd::Volume_Up
	<+NumpadSub::Volume_Down
	>+NumpadAdd::Volume_Up
	>+NumpadSub::Volume_Down

	<+NumpadMult::Volume_Mute
	>+NumpadMult::Volume_Mute

	
// SMOOTHER_SCROLLING on [Page Up] and [Page Down]

	PgUp::Click WheelUp
	PgDn::Click WheelDown 
	
	
// REFRESHING WEBPAGES
	
	//F1::
	//	MouseClick, left
	//	Send {F5}
	//	Return
		
		
// NUMPAD UTILS
	
	NumpadIns::Ctrl
	NumpadClear::Enter
	//^NumpadLeft::^+Tab
	//^NumpadRight::^Tab
	
// EMAIL

	>+<+2::Send Tymon.Oziemblewski@gmail.com
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	