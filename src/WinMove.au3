#include <MsgBoxConstants.au3>

; delta of moving distance, default is 1
Global $Delta = 1

; Shift + Left
HotKeySet("+{LEFT}", "MoveWinLeft")

; Shift + Right
HotKeySet("+{RIGHT}", "MoveWinRight")

; Shift + Up
HotKeySet("+{UP}", "MoveWinUp")

; Shift + Down
HotKeySet("+{DOWN}", "MoveWinDown")

; Shift + {+}
HotKeySet("+{+}", "IncreaseDelta")

; Shift + {-}
HotKeySet("+{-}", "DecreaseDelta")

Usage()

; Keep application alive
While 1
    Sleep(100)
WEnd

; Move left
Func MoveWinLeft()
   MoveWin(-$Delta, 0)
EndFunc

; Move right
Func MoveWinRight()
   MoveWin($Delta, 0)
EndFunc

; Move Up
Func MoveWinUp()
   MoveWin(0, -$Delta)
EndFunc

; Move down
Func MoveWinDown()
   MoveWin(0, $Delta)
EndFunc

Func MoveWin($X, $Y)
   Local $Pos = WinGetPos("[ACTIVE]")
   WinMove("[ACTIVE]", "", $Pos[0] + $X, $Pos[1] + $Y)
EndFunc

; Show usage
Func Usage()
   ToolTip("Usage: " & @CRLF & "    Shift + Left        Move left " & @CRLF & "    Shift + Right      Move right " & @CRLF & "    Shift + Up         Move up" & @CRLF & "    Shift + Down     Move down" & @CRLF & "    Shift + {+}         Increase Delta" & @CRLF & "    Shift + {-}         Decrease Delta")
   Sleep(3000)
   ToolTip("")
EndFunc

; Increase delta
Func IncreaseDelta()
   If $Delta < 10 Then
      $Delta = $Delta + 1
   EndIf
   ShowDelta()
EndFunc

; Decrease delta
Func DecreaseDelta()
   If $Delta > 1 Then
	  $Delta = $Delta - 1
   EndIf
   ShowDelta()
EndFunc

Func ShowDelta()
   ToolTip("Move " & $Delta & "px each time")
   Sleep(1000)
   ToolTip("")
EndFunc
