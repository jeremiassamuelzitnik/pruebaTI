Dism.exe /Online /Export-DefaultAppAssociations:%windir%\system32\AppAssocIE.xml
Dism.exe /Online /import-DefaultAppAssociations:%windir%\system32\AppAssocIE.xml
