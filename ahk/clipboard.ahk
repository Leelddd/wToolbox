; ======================================================================================================
; Clipboard enhancement
; paste plain text
#v::
    Clip0 = %ClipBoardAll%
    ClipBoard = %ClipBoard%       ; Convert to text
    Send ^v                       ; For best compatibility: SendPlay
    Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
    ClipBoard = %Clip0%           ; Restore original ClipBoard
    VarSetCapacity(Clip0, 0)      ; Free memory
    Return

; paste plain text with source url
; 接受了 ClipboardAll 赋值的变量以二进制格式存储数据, 因为使用类似 MsgBox 这样的方法显示时会出现乱码. 
; 并且, 修改二进制剪贴板变量 (使用类似 StringReplace 的方法) 会将它还原为普通变量, 导致它所保存的剪贴板数据的丢失
!v::
Sleep 10
CF_HTML := DllCall("RegisterClipboardFormat", "str", "HTML Format")
bin := ClipboardAll
n := 0
while format := NumGet(bin, n, "uint")
{
    size := NumGet(bin, n + 4 "uint")
    if (format = CF_HTML)
    {
        html := StrGet(&bin + n + 8, size, "UTF-8")
        RegExMatch(html, "(*ANYCRLF)SourceURL:\K.*", sourceURL)
        break
    }
    n += 8 + size
}
if !sourceURL
    return
Clipboard := bin
; Clipboard := Clipboard "`n" sourceURL
Clipboard := "[" Clipboard "](" sourceURL ")"
Send ^v
Sleep 250
Clipboard := bin
return