><#>
This will use the PSWindowsUpdate module to install Windows updates on remote machines.
Use this script at your own risk.
More info on the PSGallery here : https://www.powershellgallery.com/packages/PSWindowsUpdate/2.1.1.2
JP Erasmus
29/03/2019
#>

#Install & Import the module

Install-Module -Name PSWindowsUpdate -Verbose
Import-Module -Name PSWindowsUpdate

#Add list of computers to a .txt file to do Windows updates on

$listofcomputers=Get-Content -Path "C:\scripts\1511update.txt" 

#This loop will go and get Windows updates for each machine in the list.
foreach($computer in $listofcomputers){
Get-WindowsUpdate -ComputerName $computer -WindowsUpdate -AcceptAll -Install -Verbose 
}

#Check the current status of updates by just running the below.
$listofcomputers=Get-Content -Path "c:\scripts\win10update.txt" 
foreach($computer in $listofcomputers){
Get-WindowsUpdate -ComputerName $computer -WindowsUpdate
}
