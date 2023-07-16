# Adds users from a comma separated "internal" list. Doesn't rely on any external files, the delimiter is the new line splitting on ('`n')

$GroupCsv = @"
GroupName1
GroupName2
GroupName3
GroupName4
"@

$UserOU = "OU=Users,OU=Lakeland,DC=aspirion,DC=com"

$Groups = $GroupCsv -split (“`n”)
$Users = Get-ADUser -SearchBase $UserOU -Filter *


ForEach ($Group in $Groups) {

Get-ADGroup $Group


    $Users | ForEach-Object {
        Add-ADGroupMember -Identity $Group -Members $_
    }


}