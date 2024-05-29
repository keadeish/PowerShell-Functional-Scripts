Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
$members = @("name@domain.com", "name2@domain.com")
foreach ($member in $members) {
    Add-DistributionGroupMember -Identity "Group Name" -Member $member
}

