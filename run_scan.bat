@echo off
cd /d C:\Users\andyt\PycharmProjects\WindsorForestBrassAcademy
C:\Users\andyt\.local\bin\claude.exe --print "/scan" >> logs\scans\cron.log 2>&1
