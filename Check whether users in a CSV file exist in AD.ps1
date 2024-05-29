$data = Import-Csv -Path "C:\path.csv"

# Define an array of names to check
$namesToCheck = $data."Full name" #Full Name corresponds to a column in excel

# Loop through each name in the array
foreach ($name in $namesToCheck) {
    # Check if the user exists in Active Directory
    $user = Get-ADUser -Filter {Name -eq $name}

    if ($user -ne $null) {
        #Write-Host "User '$name' exists in Active Directory." -ForegroundColor Green
    } else {
        Write-Host "User '$name' does not exist in Active Directory." -ForegroundColor Red
    }
}