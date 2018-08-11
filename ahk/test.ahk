a := 1
global b := 2
c := 3

fun()

fun()
{
    ; a 不是全局变量，访问不了，弹出空字符串
    MsgBox, % a

    ; b 是全局变量，弹出 2
    MsgBox, % b

    ; 在函数里也可以将 c 变成全局变量
    global c
    ; 弹出 3
    MsgBox, % c
}