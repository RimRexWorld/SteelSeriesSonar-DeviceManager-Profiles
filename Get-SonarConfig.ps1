$Url = (Invoke-RestMethod -Uri https://localhost:6327/subApps).subApps.sonar.metadata.webServerAddress; 
$Backup = Invoke-RestMethod -Uri "$url/classicRedirections/" | Where-Object {$_.isRunning}
$Backup | Where-Object {$_.isRunning} | select id, deviceId | ConvertTo-Json | Out-File -FilePath (Read-Host "ExportPath")