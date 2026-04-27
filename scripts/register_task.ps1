# Run this once as Administrator to register the scheduled task.

$action = New-ScheduledTaskAction -Execute 'C:\Users\andyt\PycharmProjects\WindsorForestBrassAcademy\run_scan.bat'
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 5:00AM
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -ExecutionTimeLimit (New-TimeSpan -Hours 2)
Register-ScheduledTask -TaskName 'Claude WFBA scan' -Action $action -Trigger $trigger -Settings $settings -Force

# Allow task to run on battery (defaults block this)
$task = Get-ScheduledTask -TaskName 'Claude WFBA scan'
$task.Settings.DisallowStartIfOnBatteries = $false
$task.Settings.StopIfGoingOnBatteries = $false
Set-ScheduledTask -InputObject $task | Out-Null

Write-Host "Task registered successfully." -ForegroundColor Green
