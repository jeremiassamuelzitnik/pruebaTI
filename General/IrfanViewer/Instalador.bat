@Echo off

echo Copiando instalador de Irfanview...
xcopy /E /I /C "%~d0%~p0iview459_x64_setup.exe" "%temp%" /y /s
echo Instalando Irfanview...
cd "%temp%"
start /wait iview459_x64_setup.exe /silent /desktop=0 /thumbs=0 /group=1
cd %~d0%~p0

Echo Copiando la config...
set contador=0
cd %systemdrive%\users\
FOR /D %%A in (*.*) do set carpeta=%%A&call :cuenta

ECHO.
ECHO.

goto :final

:eof

:cuenta

set /A contador +=1

xcopy /E /I /C "%~d0%~p0Appdata\*" "%systemdrive%\users\%carpeta%\" /y /s

goto:eof
:final

xcopy /E /I /C "%~d0%~p0Appdata\*" "%systemdrive%\users\default\" /y /s
xcopy /E /I /C "%~d0%~p0ProgramFiles\*" "%programfiles%\..\Program Files\" /y /s
