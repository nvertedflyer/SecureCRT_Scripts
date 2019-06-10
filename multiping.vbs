# $language = "VBScript"
# $interface = "1.0"
' multiping.vbs
'
' Description:
' When this script is launched, the text selected within the terminal
' window is used as the destination for the multiping application.
' This script demonstrates capabilities only available in SecureCRT 6.1
' and later (Screen.Selection property).
Sub Main()
 ' Extract SecureCRT's version components to determine how to go about
 ' getting the current selection (version 6.1 provides a scripting API
 ' for accessing the screen's selection, but earlier versions do not)
 strVersionPart = Split(crt.Version, " ")(0)
 vVersionElements = Split(strVersionPart, ".")
 nMajor = vVersionElements(0)
 nMinor = vVersionElements(1)
 nMaintenance = vVersionElements(2)

 If nMajor >= 6 And nMinor > 0 Then
 ' Use available API to get the selected text:
 strText = Trim(crt.Screen.Selection)
 Else
 MsgBox "The Screen.Selection object is available" & vbcrlf & _
 "in SecureCRT version 6.1 and later." & vbcrlf & _
 vbcrlf & _
 "Exiting script."
 Exit Sub
 End If

Dim g_shell
Set g_shell = CreateObject("WScript.Shell")

g_shell.Run """C:\Program Files (x86)\MultiPing\multiping.exe""" & " " & strText


 
End Sub