Gui, Margin, 20, 20 

ButtonWidth := 460
ButtonHeight := 120

Gui, Font, s50

Gui, Add, Button, x20 y20 w%ButtonWidth% h%ButtonHeight% gRunScript, Run Index AFK
Gui, Add, Button, x20 y160 w%ButtonWidth% h%ButtonHeight% gExitGui, Exit 

Gui, Show, w500 h300, Start 
return

RunScript:
Gui, Destroy
Run, scripts\index.ahk 
Run, scripts\leave manual.ahk
ExitApp
return

ExitGui:
Gui, Destroy
ExitApp
return
