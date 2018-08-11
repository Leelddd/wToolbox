; hotkey for frequently used phrase

; read sensitive info from file
file :=FileOpen("ahk/info.txt", "r", "UTF-8")
Info := {}
While(!file.AtEOF){
    line := file.ReadLine()
    a := SubStr(line, 1, 2)
    if(a != "//"){
        kv := StrSplit(line, "|")
        tmp := kv[2]
        StringReplace,tmp,tmp,`r`n,,A
        Info.Insert(kv[1], tmp)
    }
}

; pattern: ?[abbr]
:*:?n::
    Send, % Info.n
    Return
:*:?q::
    Send, % Info.q
    Return
:*:?sn::
    Send, % Info.sn
    Return
:*:?id::
    Send, % Info.id
    Return
:*:?ex::chrome::/extensions
:*:?m::
    Send, % Info.m
    Return
:*:?pj::
    Send, C:\Users\Leeld\Documents\projects
    Return
:*:?ph::
    Send, % Info["ph"]
    Return
    