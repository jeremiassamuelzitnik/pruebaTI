@ECHO OFF
cls

ECHO Verificando si el script se ejecuta como administrador...

openfiles > NUL 2>&1 

if NOT %ERRORLEVEL% EQU 0 (echo 
	Echo Script no elevado
	Echo Verificando estado del UAC...
	for /f "skip=2 tokens=3" %%a in ('reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA') do if "%%a" equ "0x0" (
		COLOR C
		CLS
		Echo EL USUARIO QUE EJECUTA EL SCRIPT NO ES ADMINISTRADOR Y EL EQUIPO NO TIENE UAC ACTIVADO!
		SET /P Usuario=Ingrese nombre del usuario administrador: 
		runas /user: "%Usuario%" "%~d0%~p0%~n0%~x0"
		Echo.&timeout 5 > NUL&exit

	) ELSE (
		cls
		echo UAC HABILITADO
		echo ELEVANDO PRIVILEGIOS DE ADMINISTRADOR!
		powershell Start-Process '%~d0%~p0%~n0%~x0' -Verb runAs
		Echo.&timeout 5 > NUL&exit
	)
)


color 2


echo Ejecutando scripts...
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\IrfanViewer configurado\Instalador.bat '
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\Activar F8.lnk '
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\Desactivar Java Update.cmd '
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\Quitar bienvenida.cmd '
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\reacuac '
powershell start-process -WindowStyle Minimized '%~d0%~p0assets\Personalizar Barra\Personalizar barra.bat '
powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
powershell "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))"

rd %~d0%~p0..\..\ /q /s