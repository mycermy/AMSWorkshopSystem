@echo off
cls
echo Terminating AMSWorkshopSystem Process.
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
cls
echo Updating AMSWorkshopSystem

@echo off
rem for /F %%i in (repo_paths.txt) do call :pull_repo %%i
call :pull_repo

rem  call :reset_repo

pause
exit

:pull_repo
echo Pulling %1
cd %1
git pull


:reset_repo
echo Pulling %1
cd %1
git reset --hard


@echo off