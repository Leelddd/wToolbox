#SingleInstance, force
; #Include, C:\Users\Leeld\Documents\projects\wToolbox\ahk\monitor.ahk
#Include, C:\Users\Leeld\Documents\projects\wToolbox\ahk\phrase.ahk
#Include, C:\Users\Leeld\Documents\projects\wToolbox\ahk\clipboard.ahk

; suspend ahk script
!^+p::suspend toggle

; =======================================================================================================
; alt a-z / mainly for task switch and frequently used function
!a::Run, %ComSpec% /k code D:\projects\ahk ,, hide
!b::Run, www.baidu.com/s?ie=UTF-8&wd=%Clipboard%
!c::Switch("clion64.exe", false, "")
; !d shortcuts for browsers input bar
!e::Switch("Code.exe", false, "")
; !f shortcuts for everything
!g::Run, www.google.com/search?q=%Clipboard%
; !h for holmes
; !i for onetab
!j::Switch("idea64.exe", false, "")
!k::Switch("excel.exe", false, "")
; !l for onetab
; !m for mouse pointer switch between monitors / in monitor.ahk
!n::Switch("onenote.exe", false, "")
; !o for onetab
!p::Switch("pycharm64.exe", false, "")
; !q::freehotkey
!r::Run, C:\Users\Leeld\Documents\projects\wToolbox\main.ahk
!s::Switch("datagrip64.exe", false, "")
!t::Switch("typora.exe", false, "")
; !u::freehotkey
; !v paste with url
!w::Switch("winword.exe", false, "")
; focus on address in taskbar
!x::
    Send, #b
    ; Sleep 100
    Send +{TAB}
!y::Switch("webstorm64.exe", false, "")
; !z::freehotkey


; ======================================================================================================
; alt shift [alpha]: open dirs
; !+e::Run, D:\notes\ahk\test.js D:\
; !+p::Run, D:\notes\ahk\test.js D:\projects
; !+d::Run, D:\notes\ahk\test.js C:\Users\manch\Downloads
!+p::Run, C:\Users\Leeld\Documents\projects
!+d::Run, C:\Users\Leeld\Downloads
!+e::Run, C:\
!+i::Run, C:\Users\Leeld\OneDrive\Pictures
!+v::Run, C:\Users\Leeld\Videos
!+w::Run, C:\Users\Leeld\Desktop

; ======================================================================================================
;  Win10 switch desktop
LWin & CapsLock::
    send ^#{right}
    return

LWin & LShift::
    send #^{left}
    return

; ======================================================================================================
; functions
;  task switch function
Switch(name, open, path)
{
    if WinExist("ahk_exe " + name)
    {
        IfWinActive
        {
            WinMinimize
        }
        else
        {
            WinActivate
        }
    }
    else
    {
        if open
            Run, %path%
    }
    return
}
