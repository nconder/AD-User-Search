# Search for an Active Directory user where the data being passed is correct, incorrect, or incorrectly formated.
Import-Module ActiveDirectory
# Testing
#$caller = "SOME USER"

# Split and search if there is a space or '.'
$filter = ($1,$2 = ($caller.split( )| where {$_}))
$filter2 = ($3,$4 = ($caller.split(".")| where {$_}))
$filter3 = ($5,$6,$7 = ($caller.split("*.*.*")| where {$_}))
# Searching by username
if ($caller.Split(".").count - 1 -ge 1) {$username = Get-AdUser -f "SamAccountName -like '*$caller*'" | ft -HideTableHeaders SamAccountName}
elseif ($caller.Split("*.*.*").count - 1 -ge 1) {$username = Get-AdUser -f "SurName -like '*$7*' -or GivenName -like '*$6*'" | ft -HideTableHeaders SamAccountName}
# Searching by name lastname is first
elseif ($caller.Split("").count - 1 -ge 1){$username = Get-AdUser -f "SurName -like '*$2*' -and GivenName -like '*$1*'" | ft -HideTableHeaders SamAccountName}
elseif ($caller.Split("").count - 1 -ge 1){$username = Get-AdUser -f "SurName -like '*$2*' -or GivenName -like '*$1*'" | ft -HideTableHeaders SamAccountName}
# If all the above fails to produce a user id this will pass $caller as entered
if ($username -eq $null) {$username = $caller}
$username
