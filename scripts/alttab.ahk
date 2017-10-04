; AltTab-replacemet for Windows 8:

F1::
List =
WinGet, AllWinsHwnd, List
Loop, % AllWinsHwnd
{
WinGet, exStyle, exStyle, % "ahk_id" AllWinsHwnd%A_Index%
If !(exStyle & 0x100)
  Continue
WinGetTitle, CurrentWinTitle, % "ahk_id " AllWinsHwnd%A_Index%
WinGetTitle, active_title, A
If (CurrentWinTitle = active_title)
  continue
WinActivate, %CurrentWinTitle%
  break
}
return


; AltTabMenu-replacemet for Windows 8:

F2::
List =
Menu, windows, Add
Menu, windows, deleteAll
WinGet, AllWinsHwnd, List
Loop, %AllWinsHwnd%
{
WinGet, exStyle, exStyle, % "ahk_id" AllWinsHwnd%A_Index%
If !(exStyle & 0x100)
  Continue
WinGetTitle, CurrentWinTitle, % "ahk_id " AllWinsHwnd%A_Index%
WinGetClass, CurrentWinClass, % "ahk_id " AllWinsHwnd%A_Index%
Menu, windows, Add, %CurrentWinTitle%%A_Tab%ahk_class %CurrentWinClass%, WinTitle
WinGet, Path, ProcessPath, % "ahk_id " AllWinsHwnd%A_Index%
Menu, windows, Icon, %CurrentWinTitle%%A_Tab%ahk_class %CurrentWinClass%, %Path%,, 0
}
Menu, windows, Show
return

WinTitle:
WinActivate, %A_ThisMenuItem%
return