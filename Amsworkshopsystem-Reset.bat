@echo off
cls
echo Terminating AMSWorkshopSystem Process.
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
cls
echo Resetting AMSWorkshopSystem
