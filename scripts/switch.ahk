CoordMode, Mouse, Screen
SetTimer, Check, 20
return

Check:
MouseGetPos, xx, yy
n :=Normalize(xx)
u :=UnNormalize(n)
Tooltip %u%,%xx%`, %yy%, 
return

Esc::ExitApp


Normalize(x){
	return (x/1365-0.5)*2
}

UnNormalize(x){
	return Floor((x/2+0.5)*1365 )
}