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

$listofcomputers=Get-Content -Path "c:\path\to\txtfile" 

#This loop will go and get Windows updates for each machine in the list and email a status report to the provided email addess.
#YOu need to fill in the below 3 lines on the foreach loop to receive email status. If you do not wish to receive the email remote everything after the -Verbose output
#SMTP SERVER HERE    = Input your SMTP Server name
#DOMAIN HERE         = Input your domain name 
#EMAIL ADDRESS HER   = Input email address to receive status update
foreach($computer in $listofcomputers){
Get-WindowsUpdate -ComputerName $computer -WindowsUpdate -AcceptAll -Install -Verbose -SendReport -SendHistory -PSWUSettings @{SmtpServer="SMTP SERVER HERE";From="$($env:COMPUTERNAME)@DOMAIN HERE";To="EMAIL ADDRESS HERE";Port=25;Subject="$($env:COMPUTERNAME): Installed Windows Update List";Style="Table"} 
}


#Check the current status of updates by just running the below.
$listofcomputers=Get-Content -Path "c:\scripts\win10update.txt" 
foreach($computer in $listofcomputers){
Get-WindowsUpdate -ComputerName $computer -WindowsUpdate
}
