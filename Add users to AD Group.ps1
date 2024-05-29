# Define the group name
$groupName = "Group Name"

# Array of user principal names to be added
$upnArray = @("user@domain.com")
foreach ($upn in $upnArray) {
    try {
        # Get the user object based on the UPN
        $user = Get-ADUser -Filter { UserPrincipalName -eq $upn }

        # Get the group object
        $group = Get-ADGroup -Filter { Name -eq $groupName }

        # Add the user to the group
        Add-ADGroupMember -Identity $group -Members $user

        Write-Host "Added $upn to $groupName" -ForegroundColor Green
    } catch {
        Write-Host "Failed to add $upn to $groupName. Error: $_" -ForegroundColor Red
    }
}