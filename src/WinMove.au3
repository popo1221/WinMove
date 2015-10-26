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

; Shift + {0}
HotKeySet("+{0}", "resetWin")

; Shift + {9}
HotKeySet("+{9}", "ShowWinInfo")




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
   $msg = "Usage: " & @CRLF
   $msg = $msg & "    Shift + Left        Move left " & @CRLF
   $msg = $msg & "    Shift + Right      Move right " & @CRLF
   $msg = $msg & "    Shift + Up         Move up" & @CRLF
   $msg = $msg & "    Shift + Down     Move down" & @CRLF
   $msg = $msg & "    Shift + {+}         Increase Delta" & @CRLF
   $msg = $msg & "    Shift + {-}         Decrease Delta" & @CRLF
   $msg = $msg & "    Shift + {0}         Reset Window" & @CRLF
   $msg = $msg & "    Shift + {9}      Show window info"
   ToolTip($msg)
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


Func ShowWinInfo()
   Local $aPos = WinGetPos("[ACTIVE]")
   $msg = "X-Pos: " & $aPos[0] & @CRLF & _
		 "Y-Pos: " & $aPos[1] & @CRLF & _
		 "Width: " & $aPos[2] & @CRLF & _
		 "Height: " & $aPos[3]

   ToolTip($msg)
   Sleep(1000)
   ToolTip("")
EndFunc


Func resetWin()
   ; ======================================
   ; Initialize the Chrome window
   ; ======================================
   $iniFile = "conf.ini"
   If FileExists($iniFile) Then
	  ToolTip("Config file exists.")
	  Sleep(1000)
	  ToolTip("")
	  $x = IniRead ($iniFile, "settings", "x", 0 )
	  $y = IniRead ($iniFile, "settings", "y", 0 )
	  $w = IniRead ($iniFile, "settings", "width", 1204 )
	  $h = IniRead ($iniFile, "settings", "height", 768 )

	  WinMove("[ACTIVE]", "", $x, $y, $w, $h)
   EndIf
EndFunc