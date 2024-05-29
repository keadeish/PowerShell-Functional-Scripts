# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All", "User.ReadWrite.All", "Directory.Read.All", "Directory.ReadWrite.All"

# Array of user IDs (or UPNs)
$users = @("name@domain.com")

# SKU ID of the license you want to assign (replace with your SKU ID)
$licenseSkuId = "ORGANISATION:LICENSE"

# Loop through each user and assign the license
foreach ($user in $users) {
    Set-MgUserLicense -UserId $user -AddLicenses $licenseSkuId
}
