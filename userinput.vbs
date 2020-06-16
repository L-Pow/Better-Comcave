Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Sleep 1500
WshShell.AppActivate "Teilnehmer)"
WScript.Sleep 1500
WshShell.AppActivate "Login"
WScript.Sleep 1500
WshShell.SendKeys "username" '* <-- CCPortal Username
WScript.Sleep 200
WshShell.SendKeys "{TAB}"
WScript.Sleep 200
WshShell.SendKeys "password" '* <-- CCPortal Password
WScript.Sleep 200
WshShell.SendKeys "{ENTER}"
WScript.Sleep 6000
WshShell.AppActivate "Teilnehmer)"
