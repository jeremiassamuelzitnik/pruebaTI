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
$directorioScript = "$env:TEMP\ScriptGeneral"


# Definimos funciones
function obtenerAssets {

    # Creamos la carpeta temporal.
    md $directorioScript\
    CLS

    Echo Descargando archivos necesarios...
    wget $LinksAssets -OutFile $directorioScript\General.Zip

    Echo Descomprimiendo archivos necesarios...
    Expand-Archive -Path $directorioScript\General.Zip -DestinationPath $directorioScript\ -force
    CLS

}

function irfanview {
#
    $directorioScript = echo split-path -parent $MyInvocation.MyCommand.Definition
#

    #Instalar irfanview

    cd '$directorioScript\General\IrfanViewer\ '
    Start-Process -FilePath iview459_x64_setup.exe -ArgumentList '/silent /desktop=0 /thumbs=0 /group=1' -Wait 


    #Indico los archivos a copiar
    $copiarAUsuarios = "$directorioScript\General\IrfanViewer\Appdata\"

    echo $copiarAUsuarios
    pause
    #Obtengo los nombres de usuario
    $usuarios = Get-ChildItem -Path "$env:SystemDrive\users" -name
    
    #Obtengo el numero de usuarios
    $nroUsuarios = $usuarios.Count

    #Recorro carpetas de usuarios copiando archivos en cada una.
    while ( $nroUsuarios -gt 0 ) {
        $nroUsuarios -= 1
        $usuarioActual = $usuarios[$nroUsuarios]
        $nombreUsuario = Write-Host $env:SystemDrive\users\$usuarioActual

        Copy-Item -Path $copiarAUsuarios -Destination $env:SystemDrive\users\$usuarioActual -Recurse -Force -Passthru
        pause
    }
    #Copio tambien en usuario default
    Copy-Item $copiarAUsuarios $env:SystemDrive\users\Default -Recurse -Force -Passthru

    #Copio los archivos necesarios en programfiles
    

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

Remove-Item $directorioScript\ -Recurse -Force -Confirm:$false

}




obtenerAssets


irfanview


limpiarTemporalesScript
