function Get-HWID {

# Open Powershell as administrator. 

# This function creates directory C:\HWID and will generates two files. 
# One for System Info and the other for AutoPilot functions within MS Intune. 

# Variables for naming output files
$hostname = hostname
$serialnumberinfo = wmic bios get serialnumber
$serialnumber = $serialnumberinfo[2]
$serialnumber = $serialnumber -replace '\s+', ''

# Set Folder
New-Item -Type Directory -Path c:\HWID
Set-Location c:\HWID

# AutoPilot HWID
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Script -Name Get-WindowsAutopilotInfo -Force
$env:Path += ";C:\Program Files\WindowsPowerShell\Script"
Get-WindowsAutopilotInfo.ps1 -OutputFile AutoPilotHWID-$hostname-$serialnumber.csv

# SystemInfo
& {
net localgroup administrators
systeminfo
wmic bios get serialnumber
} | Out-File -FilePath SystemInfo-$hostname-$serialnumber.txt

} # End function
