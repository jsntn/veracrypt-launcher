' a VBS to call batch console without launching the command window
' refer to https://superuser.com/questions/140047/how-to-run-a-batch-file-without-launching-a-command-window
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
CreateObject("Wscript.Shell").Run scriptDir & "\xxx.NTFS.VC~T~readOnly.bat", 0, True
