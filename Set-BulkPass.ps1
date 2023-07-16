# Note to self: Do NOT use on existing user accounts - only new accounts that no users have signed into

$users = Import-Csv C:\Users\ecw\desktop\users.csv
$SecurePass = Read-Host "Enter Password" -AsSecureString

$users | ForEach {Set-ADAccountPassword -Identity $_.SamAccountName -NewPassword $SecurePass}

Start-ADSyncSyncCycle -PolicyType Delta