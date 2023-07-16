# Bulk updates proxy addresses from CSV file

Import-Module ActiveDirectory
$users = Import-CSV "C:\Users\ecw\desktop\myfile.csv" 
$users | foreach {Set-ADUser -Identity $_.samaccountname -add @{Proxyaddresses= "SMTP:" + $_.Proxyaddresses -split ","}}
# Column names are samAccountName and Proxyaddresses in the CSV file
