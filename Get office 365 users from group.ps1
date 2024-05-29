# Import the MSOnline module
Import-Module MSOnline

# Connect to Office 365
Connect-MsolService

# Specify the Office 365 group name
$groupName = "GROUP NAME"

# Get the group by name
$group = Get-MsolGroup -SearchString $groupName

if ($group -eq $null) {
    Write-Output "Group not found."
    Disconnect-MsolService
    exit
}

# Get members of the group
$members = Get-MsolGroupMember -GroupObjectId $group.ObjectId

# Create an array to store the output
$outputArray = @()

# Iterate through members and retrieve first name, last name, and UPN
foreach ($member in $members) {
    $user = Get-MsolUser -UserPrincipalName $member.EmailAddress
    $output = [PSCustomObject]@{
        FirstName       = $user.FirstName
        LastName        = $user.LastName
        Email             = $user.UserPrincipalName
    }
    $outputArray += $output
}

# Output the results to a CSV file
$outputArray | Export-Csv -Path "C:\PATH.csv" -NoTypeInformation
