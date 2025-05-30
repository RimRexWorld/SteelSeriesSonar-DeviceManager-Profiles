Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_Process' AND TargetInstance.Name = 'vrcompositor.exe'" `
                  -Action { powershell.exe -c '. "C:\Security\Set-SonarConfig.ps1" -configfile "C:\Security\VR.config";DisplaySwitch.exe /extend' }

Wait-Event