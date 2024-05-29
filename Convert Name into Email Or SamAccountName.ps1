$listOfNames = @("Jack Potato", "Chris Tucker", "Jackie Chan")
#Loop through each name in the array
foreach ($name in $listOfNames) {
    # Query Active Directory to find the SAMAccountName based on the givenName
    $user = Get-ADUser -Filter {Name -eq $name}

    # Check if a user with the given name exists
    if ($user) {
        # Display the SAMAccountName if found
        Write-Host "$($user.UserPrincipalName)" -ForegroundColor Green
    } else {
        # Display a message if no user with the given name is found
        Write-Host "$name not found in Active Directory" -ForegroundColor Red
    }
}

