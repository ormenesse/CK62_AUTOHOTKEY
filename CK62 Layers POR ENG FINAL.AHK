#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#InstallKeybdHook

SetCapsLockState, AlwaysOff

; Current_Keyboard := DllCall("GetKeyboardLayout", "UInt", 0)
; esse aqui funciona melhor
getactiveKL() {
    active_hwnd := WinExist("A")
    threadID := dllCall("GetWindowThreadProcessId", "uint", active_hwnd, "uint", 0)
    code := dllCall("GetKeyboardLayout", "uint", threadID, "uint") 
    return code
}

; Arrows

; Arrow Up
Capslock & `;::
If (getactiveKL() = 68551702)
{
	If GetKeyState("Shift")
	{
		Send +{up}
	}
	Else
	{
		Send {up}
	}
}
Else If (getactiveKL() = 67699721)
{
	Send {PgUp}
}
Return

; Arrow Up
Capslock & /::
If (getactiveKL() = 67699721)
{
	If GetKeyState("Shift")
	{
		Send +{up}
	}
	Else
	{
		Send {up}
	}
} 
Return

; Arrow Left
Capslock & RAlt::
If GetKeyState("Shift") && GetKeyState("LWin")
	Send +{Home}
Else
If GetKeyState("Shift") && GetKeyState("Control")
	Send +^{Left}
Else
If GetKeyState("Shift")
	Send +{Left}
Else
If GetKeyState("LWin")
	Send {Home}
Else
If GetKeyState("Control")
	Send ^{Left}
Else
	Send {Left}
Return

; Arrow Down
Capslock & AppsKey::
If GetKeyState("Shift")
	Send +{Down}
Else
	Send {Down}
Return

; Arrow Right
Capslock & RControl::
If GetKeyState("Shift") && GetKeyState("LWin")
	Send +{End}
Else
If GetKeyState("Shift") && GetKeyState("Control")
	Send +^{Right}
Else
If GetKeyState("Shift")
	Send +{Right}
Else
If GetKeyState("LWin")
	Send {End}
Else
If GetKeyState("Control")
	Send ^{Right}
Else
	Send {Right}
Return


; Basic Equal commands

CapsLock & ,:: Send {Del}
CapsLock & .:: Send {End}
CapsLock & k:: Send {Ins}
CapsLock & l:: Send {Home}

CapsLock & ]::
If (getactiveKL() = 67699721) 
{
	Send {Pause}
}
Return

CapsLock & [::
If (getactiveKL() = 67699721) 
{
	Send {PrintScreen}
}
Else If (getactiveKL() = 68551702)
{
	Send {Pause}
}
Return

CapsLock & sc027:: 
If (getactiveKL() = 68551702)
{
	Send {PgUp}
}
Return

CapsLock & sc028:: 
If (getactiveKL() = 68551702)
{
	Send {PgDn}
}
Return

CapsLock & sc01A:: 
If (getactiveKL() = 68551702)
{
	Send {PrintScreen}
}
Return

CapsLock & Backspace::Delete

; essa merda funciona
CapsLock & Escape::
If (getactiveKL() = 67699721) 
{
	If GetKeyState("Shift")
	{
		Send {~}
	}
	Else
	{
		Send {``}
	}
}
Else If (getactiveKL() = 68551702)
{
	If GetKeyState("Shift")
	{
		Send {`"}
	}
	Else
	{
		Send {`'}
	}	
}
Return
; Functions
CapsLock & 1::Send {F1}
CapsLock & 2::Send {F2}
CapsLock & 3::Send {F3}
CapsLock & 4::Send {F4}
CapsLock & 5::Send {F5}
CapsLock & 6::Send {F6}
CapsLock & 7::Send {F7}
CapsLock & 8::Send {F8}
CapsLock & 9::Send {F9}
CapsLock & 0::Send {F10}
CapsLock & -::Send {F11}
CapsLock & =::Send {F12}

; Arrows Alternative
CapsLock & w::Send {up}
CapsLock & a::Send {left}
CapsLock & s::Send {down}
CapsLock & d::Send {right}

; Volume
CapsLock & c::Send {Volume_Up}
CapsLock & x::Send {Volume_Down}
CapsLock & z::Send {Volume_Mute}
