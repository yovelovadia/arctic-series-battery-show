$ProgData = $env:PROGRAMDATA
$SystrayTool_Dest_Folder = "$ProgData\MySystrayTool"

$Current_Folder = (get-location).path 
$SystrayTool_Folder = "$Current_Folder\MySystrayTool"

copy-item $SystrayTool_Folder $ProgData -force -recurse
cd "C:\Program Files (x86)\Build-PS1-Systray-Tool\MySystrayTool"
powershell -windowstyle hidden  ".\PS1_Systray_Tool.ps1"			

