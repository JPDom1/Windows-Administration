#Check local or Remote computer free disk space
#This is only for the C drive to add other drives change the drive letter
#JP Erasmus
#12/03/2019
#USE AT OWN RISK!
$server = Read-Host -Prompt 'Input your Server Name'
$disk = ([wmi]"\\$server\root\cimv2:Win32_logicalDisk.DeviceID='c:'")
"$server C: has {0:#.0} GB free of {1:#.0} GB Total" -f ($disk.FreeSpace/1GB),($disk.Size/1GB) | write-output