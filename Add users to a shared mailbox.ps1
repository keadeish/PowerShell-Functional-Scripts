Connect-ExchangeOnline
# Define the shared mailbox name
$sharedMailboxName = "mailaddress@domain.com"

# Define the users to be added to the shared mailbox
$usersToAdd = @("")

# Loop through each user and add them to the shared mailbox
foreach ($user in $usersToAdd) {
    # Check if the user exists in Active Directory
    if (Get-ADUser -Filter {UserPrincipalName -eq $user}) {
        # Add the user to the shared mailbox
        Add-MailboxPermission -Identity $sharedMailboxName -User $user -AccessRights FullAccess -AutoMapping $false
        Write-Host "User $user added to $sharedMailboxName"
    } else {
        Write-Host "User $user does not exist in Active Directory"
    }
}
