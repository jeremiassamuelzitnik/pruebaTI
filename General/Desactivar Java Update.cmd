@ECHO OFF
cls
reg add "HKLM\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy" /v EnableAutoUpdateCheck /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy" /v EnableJavaUpdate /d 0 /f