
Shoot(x)
{
    MouseMove, 683, 691, 0
	Click down
	MouseMove, x+683, 500, 1
	Click up

}

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, xpos, ypos 
xpos := xpos-683
ToolTip, %xpos%
return


a::
Shoot(-40)
return

s::
Shoot(-30)
return

d::
Shoot(-20)
return

f::
Shoot(-10)
return

g::
Shoot(0)
return

h::
Shoot(10)
return

j::
Shoot(20)
return

k::
Shoot(30)
return

l::
Shoot(40)
return

r::
Shoot(-50)
return

e::
Shoot(-60)
return

w::
Shoot(-70)
return

q::
Shoot(-80)
return

y::
Shoot(50)
return

u::
Shoot(60)
return

i::
Shoot(70)
return

o::
Shoot(80)
return

t::
Click
return

b::
MouseGetPos, xpos, ypos 
MouseMove, xpos, 500, 0
return

