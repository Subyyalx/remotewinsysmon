Write-Host "System Status Check"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
Get-WmiObject Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
Get-PSDrive -PSProvider FileSystem
