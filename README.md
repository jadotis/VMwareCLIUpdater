# VMwareCLIUpdater
Installs the VMCI driver for VMware Vsphere

Requires:

A foldername from which it draws the VM names. 
A UNC path that hosts the installer (setup64.exe) --> Could be substituted for needs.
A VIserver which is where the VMs are listed. (This is where the foldername comes in)

The Snippet Below may be included if the VMware Powershell CLI is not installed:


```
if (!(Get-Module -Name VMware.VimAutomation.Core) -and (Get-Module -ListAvailable -Name VMware.VimAutomation.Core)) {  
    Write-Output "loading the VMware COre Module..."  
    if (!(Import-Module -Name VMware.VimAutomation.Core -ErrorAction SilentlyContinue)) {  
        # Error out if loading fails  
        Write-Error "`nERROR: Cannot load the VMware Module. Is the PowerCLI installed?"  
     }  
    $Loaded = $True  
    }  
    elseif (!(Get-PSSnapin -Name VMware.VimAutomation.Core -ErrorAction SilentlyContinue) -and !(Get-Module -Name VMware.VimAutomation.Core) -and ($Loaded -ne $True)) {  
        Write-Output "loading the VMware Core Snapin..."  
     if (!(Add-PSSnapin -PassThru VMware.VimAutomation.Core -ErrorAction SilentlyContinue)) {  
     # Error out if loading fails  
     Write-Error "`nERROR: Cannot load the VMware Snapin or Module. Is the PowerCLI installed?"  
     }  
    }  
```

Please feel free to contact with questions, concerns or recommendations (jadotis@bu.edu)
