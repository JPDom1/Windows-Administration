<#
Ping Computers for Up or Down status in green or red.
Provide a TXT file with list of hostnames to ping
JP Erasmus
29/03/2019
USE AT OWN RISK!
#>

function Get-Status {
 
    Get-Content "C:\path\to\computerlisttxt" | 
        foreach {
            if (-not (Test-Connection -ComputerName $_ -quiet -Count 1)){
                Write-host "$_ is down" -ForegroundColor Red
            } Else {
                    write-host "$_  is UP" -ForegroundColor Green
                    }
            }
        }
 
Get-Status