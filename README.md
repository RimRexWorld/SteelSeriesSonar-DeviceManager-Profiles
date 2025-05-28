# SteelSeries Sonar DeviceManager Profiles

Many Thanks to [Change the audio source of SteelSeries GG Sonar with a script](https://blog.thedewa.com/posts/automate-steelseries-sonar/) for providing the required informations.

# Why?
In the application SteelSeries Sonar is it Possible to map input/output devices to the Sonar audio devices.
I switch between multiple audio setups and need to modify the devices every time, so I build this Mini-Tool to help with it.

# How it Works
It connects to the local SteelSeries service and reeds the weblink for the Sonar.
It reads the .config which you provide as parameter and it will set the devices to the desired input/output.

# Create Config Files
Make configuration in SteelSeries Sonar
Run Get-SonarConfig.ps1
Provide Path for the Config File to be saved.

# Shortcuts
I am using [PowerToys](https://learn.microsoft.com/de-de/windows/powertoys/) to map the keyboard shortcuts to run the Script.

# Run when a specific application starts
## Add Listener
```PowerShell
Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_Process' AND TargetInstance.Name = 'vrcompositor.exe'" `
                  -Action { powershell.exe -c '. "C:\Security\Set-SonarConfig.ps1" -configfile "C:\Security\VR.config";DisplaySwitch.exe /extend' }
```
## Remove Listener
```PowerShell
Unregister-Event -SourceIdentifier (Get-EventSubscriber).SourceIdentifier
```

