; dual monitor mouse pointer switch

!m::
    SysGet, Mon2, MonitorWorkArea, 2
    ; MsgBox, Mon2: Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.
    ; SysGet, m, MonitorCount
    SysGet, Mon1, MonitorWorkArea, 1
    ; MsgBox, Mon1: Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
    ; id := WinExist("A")
    WinGetPos, X, Y, Width, Height, A
    MouseGetPos, xpos, ypos
    MoveMouseBetweenMonitors()
    ; MsgBox, %X% - %Y% - %Width% - %Height%
    ; MsgBox, %xpos%, %ypos%
    Return

MoveMouseBetweenMonitors()
{
    MouseGetPos, x, y
    if(x < -54){
        MouseMove, (x + 1420)*1.45 - 54, y
    }else if(x > 1374){
        MouseMove, (x - 1374)*0.69 + 8, y
    }else if(ActiveMonitor() = 1){
        MouseMove, x*1.45 + 1366, y
    }else if(ActiveMonitor() = 2){
        MouseMove, x*0.69 - 1420, y
    }
}

ActiveMonitor()
{
    WinGetPos, X, Y, Width, Height, A
    if(X > 1300){
        return 2
    }else{
        return 1
    }
}

VDSwitch(c){
    ;; 切换虚拟桌面
 
    cVD := DllCall("VirtualDesktopAccessor\GetCurrentDesktopNumber")
    VDs := DllCall("VirtualDesktopAccessor\GetDesktopCount")
    MsgBox, %cVD%, %VDs%
    if c=0
        DllCall("VirtualDesktopAccessor\GoToDesktopNumber",int, mod(cVD+1,VDs))
    else
        DllCall("VirtualDesktopAccessor\GoToDesktopNumber",int, mod(VDs-cVD-1,VDs))
}