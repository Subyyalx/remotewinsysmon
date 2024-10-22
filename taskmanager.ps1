Write-Host "System Status Check"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
Get-WmiObject Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
Get-PSDrive -PSProvider FileSystem
$cpuUsage = Get-WmiObject win32_processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
if ($cpuUsage -gt 80) {
    Write-Host "High CPU usage detected: $cpuUsage%"
} else {
    Write-Host "CPU usage is normal: $cpuUsage%"
}
