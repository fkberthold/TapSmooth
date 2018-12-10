#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

#SingleInstance Force
#UseHook On

responseSpeed=0.2

otherKeys={CapsLock}{Space}{Tab}{Enter}{Escape}{Backspace}{ScrollLock}{Delete}{Insert}{Home}{End}{PgUp}{PgDn}{Up}{Down}{Left}{Right}{Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{NumpadDot}{NumLock}{NumpadDiv}{NumpadMult}{NumpadAdd}{NumpadSub}{NumpadEnter}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{LWin}{RWin}{Control}{Alt}{Shift}{LControl}{RControl}{LShift}{RShift}{LAlt}{RAlt}{Browser_Back}{Browser_Forward}{Browser_Refresh}{Browser_Stop}{Browser_Search}{Browser_Favorites}{Browser_Home}{Volume_Mute}{Volume_Down}{Volume_Up}{Media_Next}{Media_Prev}{Media_Stop}{Media_Play_Pause}{Launch_Mail}{Launch_Media}{Launch_App1}{Launch_App2}{AppsKey}{PrintScreen}{CtrlBreak}{Pause}{Break}{Help}{Sleep}
lastKey=
empty=

Loop {
Input, Key, L1 T%responseSpeed%, %otherKeys% ;...
if Errorlevel=Max
{
   Key=%Key%
}
else if InStr(ErrorLevel,"EndKey:")
{
  Key:=SubStr(ErrorLevel,8)
  Key={%Key%}
}

if Key={Backspace}
{
  if lastKey<>%empty%
  {
    lastKey=
  }
  else
  {
    Send,%Key%
  }
}
else if lastKey<>%empty%
{
  Send, %lastKey%
  lastKey=%Key%
}
else
{
  lastKey=%Key%
}
}