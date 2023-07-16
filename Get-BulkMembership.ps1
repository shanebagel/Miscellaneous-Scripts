#Bulk retrieve group membership for all distro lists in an OU

$Groups = Get-ADGroup -SearchBase "OU=Distribution Groups,OU=ParkShore,DC=main,DC=parkshoredrug,DC=com" -Filter * | Select-Object Name

$results = Foreach ($Group in $Groups) {
Get-ADGroupMember $Group | Select-Object Name, @{n='GroupName';e={$Group.Name}}
}

$Groups | Out-File C:\Users\ecw\desktop\Groups.txt