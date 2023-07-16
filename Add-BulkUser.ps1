# Quickly Add a new AD user object from a CSV file. Specify a password, SamAccountName, update the domain and OU path and use a boolean flag to enable the account

$password = Read-Host "Type your password" -AsSecureString 

Import-Csv .\users.csv |
ForEach-Object {
  $name = "$($_.LastName) $($_.FirstName)"
   
 New-ADUser -GivenName $_.FirstName -Surname $_.LastName `
 -Name $name -SamAccountName $_.SamAccountName `
 -UserPrincipalName "$($_.SamAccountName)@shane.local" `
 -AccountPassword $password -Path "CN=Users,DC=Shane,DC=Local" `
 -Enabled:$true
}

# CSV Columns: FirstName,LastName,SamAccountName

