$groupList = @("GROUP1, GROUP2") #input group names from AD.
$data = @()
$count = 0
foreach ($group in $groupList) {
    $groupMembers = Get-ADGroupMember -Identity $group | Where-Object { $_.objectClass -eq 'user' }

    $userNames = $groupMembers | ForEach-Object { $_.Name } | Sort-Object
    Write-Host $group -ForegroundColor Yellow
    foreach ($userName in $userNames) {
    write-host $userName
    $count++
    $data += [PSCustomObject]@{
        Group = $group
        Name = $userName }
        }
}
write-host $count
$data | Export-Csv -Path "C:\PATH.csv" -NoTypeInformation
Write-Host "CSV Created" -ForegroundColor Green