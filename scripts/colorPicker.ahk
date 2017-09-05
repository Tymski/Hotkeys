#NoTrayIcon

SetCapsLockState, alwaysoff

CapsLock & 1::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
color := color
red := Mod(color,256)/1.0000
green := Mod((color - red) / 256,256)
blue := (color - red - green*256) / 256 / 256 
gamma := 2.2
r :=  pow(red / 255, gamma)
g :=  pow(green / 255, gamma)
b :=  pow(blue / 255, gamma)
color2 := tohex(FHex(blue + green*256 + red*256*256))
red := red/255.0
green := green/255.0
blue := blue/255.0
string =[%red%, %green%, %blue%, 1.000000]
string_corrected =[%r%, %g%, %b%, 1.000000]
Variable = %string%
return

CapsLock & 2::
send(string)
return

CapsLock & 3::
send(string_corrected)
return

CapsLock & 4::
send(color2)
return

pow(a,b){
	return a**b
}

send(nudes){
	ClipSaved1 := ClipboardAll
	Clipboard := nudes
	Send, ^v
	Sleep, 10
	Clipboard := ClipSaved1
	ClipSaved1 =
	return
}

tohex(num)
{
  VarSetCapacity(buf, 40)
  ;Change the %X to lowercase if you want the hex output in lowercase (ex: ff instead of FF)
  if num is integer
     DllCall("wsprintf", "str", buf, "str", "%X", "int64", num)
  if num is float
     DllCall("wsprintf", "str", buf, "str", "%X", "float", num)
  return buf
}


FHex( int, pad=0 ) { ; Function by [VxE]. Formats an integer (decimals are truncated) as hex.

; "Pad" may be the minimum number of digits that should appear on the right of the "0x".

	Static hx := "0123456789ABCDEF"

	If !( 0 < int |= 0 )

		Return !int ? "0x0" : "-" FHex( -int, pad )

	s := 1 + Floor( Ln( int ) / Ln( 16 ) )

	h := SubStr( "0x0000000000000000", 1, pad := pad < s ? s + 2 : pad < 16 ? pad + 2 : 18 )

	u := A_IsUnicode = 1

	Loop % s

		NumPut( *( &hx + ( ( int & 15 ) << u ) ), h, pad - A_Index << u, "UChar" ), int >>= 4

	Return h

}
