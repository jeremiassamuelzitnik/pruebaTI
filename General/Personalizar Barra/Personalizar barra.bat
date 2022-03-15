@Echo off

echo Copiando archivos...

%systemdrive%
echo %~d0%~p0
set contador=0
cd %systemdrive%\users\
FOR /D %%A in (*.*) do set carpeta=%%A&call :cuenta
ECHO.
ECHO.
goto :final
:eof
:cuenta
set /A contador +=1
xcopy /E /I /C "%~d0%~p0Copiar\Personalizar barra.lnk" "%systemdrive%\Users\%carpeta%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /f /s /y
del "%systemdrive%\Users\%carpeta%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Personalizar barra.cmd" /f /q
cd %systemdrive%\users\
goto:eof
:final
xcopy /E /I /C "%~d0%~p0Copiar\Personalizar barra.lnk" "%systemdrive%\Users\default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /f /s /y
del "%systemdrive%\Users\default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Personalizar barra.cmd" /f /q

xcopy /E /I /C "%~d0%~p0Copiar\Personalizar barra.cmd" "%windir%\GPO\" /f /s /y

