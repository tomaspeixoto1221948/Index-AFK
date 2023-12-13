#IfWinActive AHK_exe Warframe.x64.exe
#MaxThreadsPerHotkey 5

^j:: ; ctrl + j
    afk := !afk
    if (afk){
        CenteredToolTip("On")
    }

    Else {
        CenteredToolTip("Off")
    }
    
    Sleep 2000

    While (afk){
        Random, rand, 0, 100
        Send {ESC}
        Sleep 5000 + rand
        MouseMove 410, 380
        Sleep 5000 + rand
        Click
        Sleep 10000 + rand
        Send {ESC}
        Sleep 5000 + rand
        MouseMove 1400, 860
        Sleep 5000 + rand
        Click
        Sleep 5000 + rand
        MouseMove, 985, 565
        Sleep 5000 + rand
        Click
        Sleep 5000 + rand
        MouseMove, 1560, 890
        Sleep 5000 + rand
        Click
        Sleep 5000 + rand
        MouseMove, 750, 600 
        Sleep 5000 + rand
        Click
        Sleep 5000 + rand

        while (afk) {
            PixelGetColor, color, 1835, 970, RGB ; change this pixel if you need
            if (color = 0xFFFFFF && afk) {
                Sleep 2000
                Goto Spot
            }
        }

        Spot:
            Send {w down}{Shift down} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Sleep 8000
            Send {Shift up}{w up} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Send {d down}{Shift down} ; change "d" to your (Move Right) key 
            Sleep 1450
            Send {Shift up}{d up} 
            Send {w down}{Shift down} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Sleep 3050
            Send {Shift up}{w up} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Send 6
            MouseGetPos startX, startY
            newEndX := startX + 25
            newEndY := startY
            MouseClickDrag, Left, %startX%, %startY%, %newEndX%, %newEndY%
            Send {w down}{Shift down} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Sleep 1750
            Send {Space} ; change "Space" to your (Jump) key
            Sleep 600
            Send {Space} ; change "Space" to your (Jump) key
            Sleep 600
            Send {Space} ; change "Space" to your (Jump) key
            Sleep 3800
            Send {Shift up}{w up} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            MouseGetPos startX, startY
            newEndX := startX + 25
            newEndY := startY
            MouseClickDrag, Left, %startX%, %startY%, %newEndX%, %newEndY%
            Send {w down}{Shift down} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Send {Space}  ; change "Space" to your (Jump) key
            Sleep 100
            Send {Space} ; change "Space" to your (Jump) key
            Sleep 1000
            Send {Shift up}{w up} ; change "Shift" to your (Sprint / Dodge) key and change "w" to your (Move Forward) key 
            Send {d down}{Shift down} ; change "Shift" to your (Sprint / Dodge) key and change "d" to your (Move Right) key
            Sleep 250
            Send {Shift up}{d up}
            MouseGetPos startX, startY
            newEndX := startX - 10
            newEndY := startY
            MouseClickDrag, Left, %startX%, %startY%, %newEndX%, %newEndY%
            Send {w down} ; change "w" to your (Move Forward) key 
            Sleep 3000
            Send {Shift} ; change "Shift" to your (Sprint / Dodge) key
            Send {w up} ; change "w" to your (Move Forward) key 
            Sleep 1000
            Send r  ; change "r" to your (Reload) key
            Sleep 2500
            Send 6 ; change "6" to your (Focus and Transference) key
            Sleep 1000

        counter := 0
        counter2 := 0

        Random, rand, 0, 5000
        StartTime := A_TickCount
        while (A_TickCount - StartTime < (2700000 + rand) && afk) {
            counter2 ++
            Random, rand2, 0, 5000
            StartTime2 := A_TickCount
            while (A_TickCount - StartTime2 < (15000 + rand2) && afk) {
                counter := 0
                CheckColor:
                    PixelGetColor, color, 1835, 970, RGB ; change this pixel if you need
                    if (color = 0xFFFFFF && afk) {
                        counter++
                        counter2 := 0
                        Random, rand, 0, 5000
                        StartTime2 := A_TickCount
                        sleep 500
                        Send 6 ; change "6" to your (Focus and Transference) key
                        Send {w down} ; change "w" to your (Move Forward) key 
                        Sleep 500 
                        Send {Shift} ; change "Shift" to your (Sprint / Dodge) key
                        Send {w up} ; change "w" to your (Move Forward) key  
                        if (counter = 3) {
                            Goto Continue
                        }
                        Goto CheckColor
                    }
                    if (counter2 = 10){
                    Goto Loop
                }
                  
            }
        Send 6 ; change "6" to your (Focus and Transference) key
        Sleep 500
        }

    Continue:
        if (afk){
        Run, scripts\leave auto.ahk
        }
        counter := 0
        while (afk) {
                Random, rand3, 0, 5000
                StartTime3 := A_TickCount
                counter ++
                while (A_TickCount - StartTime3 < (15000 + rand3) && afk) {
                    PixelGetColor, color2, 1835, 970, RGB ; change this pixel if you need
                    if (color2 = 0xFFFFFF && afk) {
                        counter := 0
                        Random, rand3, 0, 5000
                        StartTime3 := A_TickCount
                        sleep 500
                        Send 6 ; change "6" to your (Focus and Transference) key
                        Send {w down} ; change "w" to your (Move Forward) key 
                        Sleep 500 
                        Send {Shift} ; change "Shift" to your (Sprint / Dodge) key
                        Send {w up} ; change "w" to your (Move Forward) key  
                    }  
                }
                if (counter = 10){
                    Goto Loop
                }
            Send 6 ; change "6" to your (Focus and Transference) key
            Sleep 500
        }

    Loop:
        if (afk){
        Send {ESC}
        Sleep 10000
        }
        }

    
CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
    ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
    SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
}
RemoveToolTip(){
    ToolTip
}