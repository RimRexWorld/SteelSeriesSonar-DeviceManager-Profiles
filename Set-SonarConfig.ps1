param($configfile)

$start = Get-Date
$APIconnection = Get-NetTCPConnection | Where-Object {$_.State -eq "LISTEN" -and $_.OwningProcess -eq (Get-Process -Name SteelSeriesSonar).Id}
$Url = "http://$($APIconnection.LocalAddress):$($APIconnection.LocalPort)"
$end = Get-Date
($end - $start).Milliseconds
Write-Host $Url

$Config = Get-Content -Path $configfile | ConvertFrom-Json
$Config | ForEach {Invoke-RestMethod -Uri "$url/classicRedirections/$($_.id)/deviceId/$($_.deviceId)" -Method Put}
