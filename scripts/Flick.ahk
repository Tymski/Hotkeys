End::
MouseGetPos, x, y
x := Normalize(x)
x := x*(-1)
x := UnNormalize(x)
MouseMove, x, y,0
return

Home::
MouseClick, left
return

Normalize(x){
	return (x/1365-0.5)*2
}

UnNormalize(x){
	return Floor((x/2+0.5)*1365 )
}

Shift & End::ExitApp










