#Bulk creates AD Distro Groups from a CSV

Import-Module ActiveDirectory
$Users = Import-CSV 'C:\Users\ecw\Desktop\DL.csv'

ForEach ($User in $Users){

$groupProperties = @{

Name = $User.Name
DisplayName = $User.Name
Path = "OU=Distribution Groups,OU=ParkShore,DC=main,DC=parkshoredrug,DC=com"
SamAccountName = $User.Name
GroupScope = "Universal"
GroupCategory = "Distribution"

}

New-ADGroup @groupProperties

}