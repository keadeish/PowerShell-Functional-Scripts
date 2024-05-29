#Creating A Distribution List:
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
#PrimarySmtpAddress = address of the Distribution List
#Name = Name of the Distribution List
$owners =@("owner@domain.com")
$members =@("name@domain.com", "name2@domain.com")
New-DistributionGroup -Name "GROUP NAME" -PrimarySmtpAddress "GROUP_NAME@DOMAIN.com" -ManagedBy $owners -Members $members
write-host -ForegroundColor Green 'done'
