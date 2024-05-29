$listOfNames = @("Jack Potato", "Chris Tucker", "Jackie Chan")
Connect-MsolService
# Loop through each name in the array
foreach ($name in $listOfNames) {
    # Query Active Directory to find the SAMAccountName based on the givenName
    $user = Get-MsolUser -searchstring $name| Select-Object userprincipalname

    # Check if a user with the given name exists
    if ($user) {
        # Display the SAMAccountName if found
        Write-Host "$($user.UserPrincipalName)" -ForegroundColor Green
    } else {
        # Display a message if no user with the given name is found
        Write-Host "$name not found" -ForegroundColor Red
    }
}

#Use this script if the user is on Exchange & not AD