
# Define the ObjectId of the group
$groupObjectId = '1111111111111111111111111111'

# Define an array of user UPNs to add to the group
$membersToAdd = @(
    'EMAIL1@MAIL.COM',      
    'EMAIL2@MAIL.COM'
)
# Iterate through the members and add them to the group
foreach ($member in $membersToAdd) {
    try {
        Add-MsolGroupMember -GroupObjectId $groupObjectId -GroupMemberUserPrincipalName $member -ErrorAction Stop
        Write-Host "Added $member to the group with ObjectId: $groupObjectId"
    } catch {
        Write-Host "Error adding $member to the group: $_"
    }
}
