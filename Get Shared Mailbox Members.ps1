Connect-ExchangeOnline
$mailbox = 'MAILBOX@MAIL.com'
$fullAccessPermissions = Get-MailboxPermission -identity $mailbox | Where-Object {$_.AccessRights -contains "FullAccess"}
(Get-Mailbox -identity $mailbox).Name #Retrieves the name of the group
foreach ($permission in $fullAccessPermissions) {
    write-host $permission.User
}

 
