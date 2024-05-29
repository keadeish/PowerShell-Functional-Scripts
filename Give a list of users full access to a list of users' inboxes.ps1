# Import the module
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

# Step 3: Define the target mailbox and the list of users to grant access
$targetMailboxes = @("Email1@mail.com", "Email2@mail.com") #Email addresses of owners of inboxes
# List of user emails to be granted full access
$userEmails = @("Email1@mail.com", "Email2@mail.com") #Users you'd like to add to each of the $targetMailboxes
# Step 4: Grant Full Access permissions

foreach ($targetMailbox in $targetMailboxes){

foreach ($userEmail in $userEmails) {
    Add-MailboxPermission -Identity $targetMailbox -User $userEmail -AccessRights FullAccess -InheritanceType All -AutoMapping $false
}
}

# Step 5: Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
