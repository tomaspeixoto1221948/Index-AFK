#IfWinActive AHK_exe Warframe.x64.exe
#MaxThreadsPerHotkey 5

ToggleScript:
    leave := !leave
    counterLeave := 0
    if (leave){
        CenteredToolTip("On")
    }
    else {
        CenteredToolTip("Off")
    }
    Sleep 10000
    Send {ESC}
    sleep 1000
    MouseMove, 562, 550
    Send {ESC}

    While (leave){
        Click, Left, 1
        send r ; change "Shrift" to your (Reload) key
        sleep 2500
        Start := A_TickCount
        while (A_TickCount - Start < 4000) {
            PixelGetColor, colorLeave, 1855, 970, RGB ; change this pixel if you need
            if (colorLeave = 0xFFFFFF ) {
                counterLeave := 0
            }
            sleep 1000
        }
        counterLeave++

        if (counterLeave = 20) {
                ExitApp
            }
    }
    

CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
    ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
    SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
}
RemoveToolTip(){
    ToolTip
}