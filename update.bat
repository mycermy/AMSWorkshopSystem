@echo off
cls
echo Terminating AMSWorkshopSystem Process.
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do echo %%A=%%B &tskill %%B>nul
cls
echo Updating AMSWorkshopSystem

:menu
echo.
echo 1. Update
echo 2. Reset
echo 3. Exit
set /p choice="Enter your choice (1/2/3): "

if "%choice%"=="1" (
    call :pull_repo
) else if "%choice%"=="2" (
    call :reset_repo
) else if "%choice%"=="3" (
    exit
) else (
    echo Invalid choice. Please select 1, 2, or 3.
    goto menu
)

:: Timer (1 minute delay)
timeout /t 60 >nul
goto :eof

:pull_repo
REM Pull Git Repository
echo Pulling %1
cd %1
git pull
goto :eof

:reset_repo
REM Hard Reset Repository
set /p "password=Enter the password for hard reset: "
if "%password%"=="hardreset" (
    echo Resetting repo %1
    cd %1
    git reset --hard
    git pull
) else (
    echo Incorrect password. Operation canceled.
)
goto :eof

:eof
exit