#changes their signature
Set-ADUser -Identity "SAMACCOUNTNAME" -Replace @{info="What you'd like the signature to be replaced with"}
#checks their signature: 
Get-ADUser -Identity "SAMACCOUNTNAME" -Properties info | Select-Object -ExpandProperty info
