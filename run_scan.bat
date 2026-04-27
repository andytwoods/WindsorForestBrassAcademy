@echo off
cd /d C:\Users\andyt\PycharmProjects\WindsorForestBrassAcademy
echo [%date% %time%] --- /scan starting --- >> logs\scans\cron.log
git stash >> logs\scans\cron.log 2>&1
git pull --rebase >> logs\scans\cron.log 2>&1
git stash pop >> logs\scans\cron.log 2>&1
C:\Users\andyt\.local\bin\claude.exe --print --dangerously-skip-permissions "/scan" >> logs\scans\cron.log 2>&1
git push >> logs\scans\cron.log 2>&1
echo [%date% %time%] --- /scan done --- >> logs\scans\cron.log
