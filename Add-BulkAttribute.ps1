# Bulk Update AD User/Group Attributes from CSV

Import-Module ActiveDirectory
$Users = Import-CSV 'C:\Users\ecw\Desktop\DL.csv'

ForEach ($User in $Users){

$groupAttributes = @{

Identity = $user.Name
Replace = @{Mail=$user.Email}


}

Set-ADGroup @groupAttributes

}