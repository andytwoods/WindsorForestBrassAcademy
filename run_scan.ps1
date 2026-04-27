Set-Location 'C:\Users\andyt\PycharmProjects\WindsorForestBrassAcademy'
$log = 'logs\scans\cron.log'
$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
Add-Content -Path $log -Value "[$ts] --- /scan starting ---"
git stash 2>&1 | Add-Content -Path $log
git pull --rebase 2>&1 | Add-Content -Path $log
git stash pop 2>&1 | Add-Content -Path $log
& 'C:\Users\andyt\.local\bin\claude.exe' --print --dangerously-skip-permissions '/scan' *> 'logs\scans\cron-claude.tmp'
Get-Content 'logs\scans\cron-claude.tmp' | Add-Content -Path $log
Remove-Item 'logs\scans\cron-claude.tmp' -ErrorAction SilentlyContinue
git push 2>&1 | Add-Content -Path $log
Add-Content -Path $log -Value "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] --- /scan done ---"
