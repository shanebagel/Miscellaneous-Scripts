# Imports users from a comma separated list, uses a for loop to add those users to a specified group using Add-AdGroupMember 

$Groups = Import-CSV C:\Users\ecw_aspirion\users.csv 


$Groups |

ForEach-Object {

$Group = $_.Group 

Get-ADUser -SearchBase "OU=Users,OU=Lakeland,DC=aspirion,DC=com" -Filter * | ForEach-Object { 
Add-AdGroupMember -Identity $Group -Members $_}

}