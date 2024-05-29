# Get the Active Directory domain name
$DomainName = (Get-ADDomain).DNSRoot

$UsersInUK = Get-ADUser -Filter {Enabled -eq $true} -Properties GivenName, Surname, EmailAddress, Title, Department, Office, SamAccountName -Server $DomainName | Where-Object {
    $_.Name -ne $null -and $_.EmailAddress -ne $null -and $_.Title -ne $null -and $_.SamAccountName -ne $null -and $_.Department -ne $null -and $_.Department -ne $null -and $_.DistinguishedName -notlike "*SAP Testing*" #Excludes names that include 'SAP Testing'
}

# Display the results
$UsersInUK | Select-Object GivenName, Surname, EmailAddress, Title, Department, Office, SamAccountName | Format-Table -AutoSize

# Export the results to a CSV file
$UsersInUK | Select-Object GivenName, Surname, EmailAddress, Title, Department, Office, SamAccountName | Export-Csv -Path "C:/PATH.csv" -NoTypeInformation

# Display a message indicating the export is complete
Write-Host "User information has been exported" -ForegroundColor Green
#figure out how to filter out names with 'test'