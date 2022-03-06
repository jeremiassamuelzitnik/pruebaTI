wget https://raw.githubusercontent.com/jeremiassamuelzitnik/pruebaTI/master/general.zip -OutFile $env:TEMP\JeremosTKBio\General.zip
Expand-Archive -Path $env:TEMP\JeremosTKBio\General.Zip -DestinationPath $env:TEMP\JeremosTKBio\ -force
Start-Process  $env:TEMP\JeremosTKBio\General\script` general.cmd
