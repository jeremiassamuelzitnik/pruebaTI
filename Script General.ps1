    # Verificamos si se requiere elevación de privilegios...
    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
        if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
            $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        
            #Verificamos estado del LUA...
            $lua =(Get-Itemproperty hklm:software\microsoft\windows\currentversion\policies\system).enablelua
             If ($lua -ne 0){
                 #Si está activado elevamos privilegios con UAC...
                 
                 Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
                 Exit
            }
            #Si LUA está desactivado solicitamos otro usuario...
            Start-Process -FilePath PowerShell.exe -Verb RunAsUser -ArgumentList $CommandLine
            Exit
        }

    }
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Definimos parametros.
$LinksAssets = "https://raw.githubusercontent.com/jeremiassamuelzitnik/pruebaTI/master/General.zip"
$carpetaTemporalScript = "$env:TEMP\ScriptGeneral"


# Definimos funciones
function obtenerAssets {

    # Creamos la carpeta temporal.
    md $carpetaTemporalScript\
    CLS

    Echo Descargando archivos necesarios...
    wget $LinksAssets -OutFile $carpetaTemporalScript\General.Zip

    Echo Descomprimiendo archivos necesarios...
    Expand-Archive -Path $carpetaTemporalScript\General.Zip -DestinationPath $carpetaTemporalScript\ -force
    CLS

}

function Irfanview {

#$carpetaTemporalScript\Irfanview

}

function ActivarF8 {

}

function deshabilitarJavaUpdate {

}

function quitarWizzardPrimerLogin {

}

function configurarUAC {

}

function personalizarBarra {

}

function instalarChocolatey {

powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

}

function scriptCTT {

powershell "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))"

}

function limpiarTemporalesScript {

Remove-Item $carpetaTemporalScript\ -Recurse -Force -Confirm:$false

}


obtenerAssets
limpiarTemporalesScript
