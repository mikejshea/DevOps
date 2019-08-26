
Adding yourself to the Hyper-V Administrators group with PowerShell
([adsi]”WinNT://./Hyper-V Administrators,group”).Add(“WinNT://$env:UserDomain/$env:Username,user”)
