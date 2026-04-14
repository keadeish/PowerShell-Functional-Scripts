Connect-ExchangeOnline
Get-DynamicDistributionGroupMember -Identity "Enter Dynamic Group Name Here" |
    Select-Object DisplayName, PrimarySmtpAddress |
    Export-Csv -Path "C:\Temp\location.csv" -NoTypeInformation
