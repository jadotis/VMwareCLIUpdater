param
(
   [Parameter(Mandatory=$true)] [string] $foldername, #VDI
   [Parameter(Mandatory=$true)] [string] $myUNCPATH,
   [Parameter(Mandatory=$true)] [string] $VISERVER
)

Connect-VIServer $VISERVER


# Installs the powershell CLI for the Host if not already installed.

$vmList = get-Vm -Location (get-folder -name $foldername)
foreach($vm in $vmList){
    try{
       Mount-Tools -Vm $vm -erroraction 'silentlystop'
    }
    catch{
       write-host  "Could not Mount tools on: " $vm", probably already mounted"
    }
}
foreach($vm in $vmList){
try{
    Enter-PSSession -ComputerName $vm
    cd $myUNCpath
    ./setup64.exe /v "/qn REBOOT=R ADDLOCAL=ALL REMOVE=Hgfs"
    shutdown -r    
    Exit-PSSession
    }
    catch
    {
        write-host "Error connecting to Vm: "$vm
    }
}

write-host "finished"
