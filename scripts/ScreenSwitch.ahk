#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

MouseGetPos, xpos, ypos 
Msgbox, The cursor is at X%xpos% Y%ypos%. 

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
MouseGetPos, xpos, ypos 
ToolTip, Floor(%xpos%/1920.0*1366.0) %ypos%
return

F1::
Switch()
return

F2::
MouseMove

Switch()
{
	MouseGetPos, x, y 
	if (y<0) {
		newX = Floor(x/1920.0*1366.0)
		newY = Floor(y/1080.0*768.0)
		  MouseMove, NewX, NewY
	}
	if (y>0) {
		newX = Floor(x/1366.0*1920.0)
		newY = Floor(y/768.0*1080.0)
	  	MouseMove, NewX, NewY
	}
	return
}