#NoTrayIcon
#CommentFlag //


// Keep Window on top: Ctrl F1 

	^F1::  Winset, Alwaysontop, , A
	Return


// Hide title bar and window borders: Ctrl F2 

	^F2::
		WinActive("A")
		// WinGetPos, X, Y
		WinSet, Style, -0xC40000 // Remove Titlebar and Borders (WS_CAPTION | WS_SIZEBOX)
		// WinMove, X,Y
		WinMove, 0,0
		WinMaximize
	Return

	^F3::
		WinActive("A")
		WinSet, Style, +0xC40000 // Add Titlebar and Borders (WS_CAPTION | WS_SIZEBOX)
		WinMaximize
	Return


// Make window semi-transparent Ctrl f3

	^F4:: 
		WinGet, currentTransparency, Transparent, A
		currentTransparency := currentTransparency-10
		if(currentTransparency < 0){ 
			currentTransparency := 0
		}
		WinSet, Transparent, %currentTransparency%, A
	Return

// Make window opaque ctrl f4
	^F5::  
		WinSet, Transparent, 255, A
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
	
	// NumpadIns::Ctrl
	// Use Control PageUp Control PageDown0
	// NumpadClear::Enter
	//^NumpadLeft::^+Tab
	//^NumpadRight::^Tab
	
// EMAIL

	>+<+2::Send Tymon.Oziemblewski@gmail.com
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//^F5::ToggleMenu()
//Return
ToggleMenu()
{
  //static associative array for keeping track of all windows that have had their menus hidden
  static MenuArray := {}
 
  //find active window handle in array / add to array if not found
  hWin := WinExist("A")
  hMenu := null
  hMenu := MenuArray.Remove(hWin)
  if (hMenu = null)
  {
    //store a reference to the window's menu in the array
    hMenu := (DllCall("GetMenu", "uint", hWin))
    MenuArray[hWin] := hMenu
    
    //hide the menu by uncoupling it from the parent window
    DllCall("SetMenu", "uint", hWin, "uint", 0)
  }
  else
  {
    //show menu by recoupling it to the parent window
    DllCall("SetMenu", "uint", hWin, "uint", hMenu)
  }
}
	
	
	
	