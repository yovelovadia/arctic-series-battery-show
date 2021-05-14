arctic series 7 headphones battery indicator at the task bar

In order for this to work get into windows Task Scheduler

in General tab remeber to have run only when user is logged on and run with highest privileges on

in Triggers tab at log on

in Actions tab
Program/script: powershell.exe
Add arguments: -ExecutionPolicy ByPass -File "{pathToDirectory}\ArcticSeriesBatteryShow\Create_Structure.ps1"

used https://github.com/atagulalan/arctis-battery-percentage
https://github.com/damienvanrobaeys/Build-PS1-Systray-Tool
