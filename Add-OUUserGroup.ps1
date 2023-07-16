# Script to Get all users in a particular OU in AD, and add those users based on SamAccountName property to a specified group

Get-ADUser -filter * -searchbase "OU=Users,OU=Lakeland,DC=aspirion,DC=com" | ForEach-Object {Add-AdGroupMember -Identity LAK_SP_ATU_READ -members $_.SamAccountName}