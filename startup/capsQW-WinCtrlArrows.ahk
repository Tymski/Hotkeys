#NoTrayIcon

SetCapsLockState, alwaysoff

#UseHook ON

CapsLock & w::
Send, {LWin Down}{RCtrl Down}{Right}{RCtrl Up}{LWin Up}		
return

CapsLock & q::
Send, {LWin Down}{RCtrl Down}{Left}{RCtrl Up}{LWin Up}
return


CapsLock & a::
If GetKeyState("Shift")
 Send {U+0391} ; Alpha
else
 Send {U+03B1} ; alpha
Return

CapsLock & b::
If GetKeyState("Shift")
 Send {U+0392} ; Beta
else
 Send {U+03B2} ; beta
Return

CapsLock & c::
If GetKeyState("Shift")
 Send {U+0393} ; Gamma
else
 Send {U+03B3} ; gamma
Return

CapsLock & d::
If GetKeyState("Shift")
 Send {U+0394} ; Delta
else
 Send {U+03B4} ; delta
Return

CapsLock & e::
If GetKeyState("Shift")
 Send {U+0395} ; Epislon
else
 Send {U+03B5} ; epislon
Return

CapsLock & s::
If GetKeyState("Shift")
 Send {U+03A3} ; Sigma
else
 Send {U+03C3} ; sigma
Return

; CapsLock & p::
; If GetKeyState("Shift")
;  Send {U+03A0} ; Pi
; else
;  Send {U+03C0} ; pi
; Return


CapsLock & k::
If GetKeyState("Shift")
 Send {U+209A} ;
else
 Send {U+2096} ;
Return


SetMouseDelay, 0

CapsLock & Enter::
Click
Return



CapsLock & z::
send ^c
send ^t
send ^v
send {Enter}
Return

CapsLock & x::
send ^w
Return

CapsLock & Insert::
SetScrollLockState, On
Return


CapsLock & r::
send ^s
send {F13}
Return

CapsLock & l::
send console.log();
send {left}{left}
sleep, 200
send {Escape}
Return

; Alt & l::
; If GetKeyState("Shift")
;  Send {U+0141} ; Ł
; else
;  Send {U+0142} ; ł
; Return

CapsLock & o::
    presshome()
Return

CapsLock & p::
    pressend()
Return

CapsLock & ]::
    pressend()
    send {}}
Return

CapsLock & [::
    presshome()
    send {{}

Return

CapsLock & 0::
    pressend()
    send `)
Return

CapsLock & 9::
    presshome()
    send `(
Return

CapsLock & `;::
    pressend()
    Send `;
Return

CapsLock & -::
    send {Left}
Return

CapsLock & =::
    send {Right}
Return


pressend(){
    If GetKeyState("Shift")
    send {ShiftDown}{End}{ShiftUp}
    else
    send {End}
}

presshome(){
    If GetKeyState("Shift")
    send {ShiftDown}{Home}{ShiftUp}
    else
    send {Home}
}

; SetKeyDelay,100
; CapsLock & [::

;     If (GetKeyState("Shift")){
;         send {ShiftDown}
;     }
;     If (GetKeyState("Ctrl")){
;         send {Ctrl Down}
;     }

;     send {Home}


;     If (GetKeyState("Ctrl")){
;         send {Ctrl Up}
;     }
;     If (GetKeyState("Shift")){
;         send {ShiftUp}
;     }
; Return




; COLOR PICKER
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
    color2 := tohex(FHex(blue + green*256 + red*256*256,6))
    color2 := SubStr("000000" . color2, -5)
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


    StrPad(str, padchar, padlen, left=1){
        if (i := padlen-StrLen(str))
            VarSetCapacity(w, i, asc(padchar)),  NumPut(0, &w+i, "Char"),  VarSetCapacity(w, -1)
        return left ? w str : str w
    }
; END OF COLOR PICKER