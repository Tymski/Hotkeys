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

CapsLock & p::
If GetKeyState("Shift")
 Send {U+03A0} ; Pi
else
 Send {U+03C0} ; pi
Return


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
send {F13}
Return

CapsLock & l::
send console.log();
send {left}{left}
sleep, 200
send {Escape}
Return