z::
MouseGetPos, x, y
if( x > 1366/2)
Send, Right
Else
Send, Left
if( y > 768/2)
Send, Down
Else
Send, Up
Return