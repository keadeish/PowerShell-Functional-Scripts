# Specify the group name
$groupName = "GROUP NAME"

# Get all members of the group
$groupMembers = Get-ADGroupMember -Identity $groupName

# Remove each member from the group
foreach ($member in $groupMembers) {
    Remove-ADGroupMember -Identity $groupName -Members $member -Confirm:$false
}

Write-Host "All members removed from group: $groupName" -ForegroundColor Green
