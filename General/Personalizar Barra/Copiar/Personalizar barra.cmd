@echo off
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /v PenWorkspaceButtonDesiredVisibility /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v Migrated /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\7-Zip" /v Lang /t REG_SZ /d Es /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f



taskkill /f /im explorer.exe
start explorer.exe

del "%homepath%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Personalizar barra.lnk" /f /q