param($configfile)

$start = Get-Date
$Url = (Invoke-RestMethod -Uri https://localhost:6327/subApps).subApps.sonar.metadata.webServerAddress
$end = Get-Date
($end - $start).Milliseconds
Write-Host $Url

$Config = Get-Content -Path $configfile | ConvertFrom-Json
$Config | ForEach {Invoke-RestMethod -Uri "$url/classicRedirections/$($_.id)/deviceId/$($_.deviceId)" -Method Put}