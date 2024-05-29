#Find groups like ...
function Get-ADGroupFunction {
param ([string]$groupSearch) 
Get-ADGroup -Filter {Name -like $groupSearch}  -Properties * | select -property SamAccountName,Name
}

$enteredText = 'GROUP NAME'
Get-ADGroupFunction -groupSearch *$enteredText*