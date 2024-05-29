$groupList = @("GROUP1, GROUP2")
$data = [System.Collections.ArrayList]@()

# Use a Hashtable to track unique email addresses
$uniqueEmails = @{}

function Get-NestedGroupMembers {
    param (
        [string]$group
    )

    $groupMembers = Get-ADGroupMember -Identity $group | Where-Object { $_.objectClass -eq 'user' }

    Write-Host "Processing group: $group" -ForegroundColor Yellow

    foreach ($user in $groupMembers) {
        $userObject = Get-ADUser -Identity $user -Properties GivenName, Surname, UserPrincipalName, Office, info, Title, Department
        $userGroup = $group

        $upn = $userObject.UserPrincipalName
        if ([string]::IsNullOrEmpty($upn)) {
            $upn = "N/A"
        }

        # Check if the email address is unique
        if ($upn -ne "N/A" -and -not $uniqueEmails.ContainsKey($upn)) {
            $uniqueEmails[$upn] = $true

            $data.Add([PSCustomObject]@{
                #Group = $userGroup
                FirstName = $userObject.GivenName
                LastName = $userObject.Surname
                Email = $upn
                #PAs = $userObject.info
                City = $userObject.City
                Office = $userObject.Office
                Title = $userObject.Title
                Department = $userObject.Department
            }) | Out-Null
        }
    }

    # Recursively process nested groups
    $nestedGroups = Get-ADGroupMember -Identity $group | Where-Object { $_.objectClass -eq 'group' }

    foreach ($nestedGroup in $nestedGroups) {
        Get-NestedGroupMembers -group $nestedGroup
    }
}

foreach ($group in $groupList) {
    Get-NestedGroupMembers -group $group
}

# Export the data to a CSV file
$data | Export-Csv -Path "C:\PATH.csv" -NoTypeInformation

Write-Host "CSV Created" -ForegroundColor Green
