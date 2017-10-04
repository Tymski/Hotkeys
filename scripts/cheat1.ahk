
Shoot(ms)
{
	Click down
	Sleep ms
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
Shoot(200)
return

s::
Shoot(300)
return

d::
Shoot(400)
return

f::
Shoot(500)
return

g::
Shoot(600)
return

h::
Shoot(700)
return

j::
Shoot(800)
return

k::
Shoot(900)
return

l::
Shoot(1000)
return

q::
Shoot(1100)
return

w::
Shoot(1200)
return

e::
Shoot(1300)
return

r::
Shoot(1400)
return

t::
Shoot(1500)
return

y::
Shoot(1600)
return

u::
Shoot(1700)
return

i::
Shoot(1800)
return

o::
Shoot(1900)
return

p::
Shoot(2000)
return




b::
MouseGetPos, xpos, ypos 
MouseMove, xpos, 500, 0
return

