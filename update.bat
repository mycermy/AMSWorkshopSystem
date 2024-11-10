@echo off
cls
echo Terminating AMSWorkshopSystem Process.

for /L %%i in (1,1,3) do (
    for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq javaw.exe" /NH') do (
        echo %%A=%%B
        tskill %%B >nul
    )
)

cls
echo Updating AMSWorkshopSystem

:menu
echo.
echo 1. Update
echo 2. Reset
echo 3. Exit
choice /c 123 /t 10 /d 3 /m "Enter your choice (1/2/3)"

if errorlevel 3 (
    echo Timeout reached or Exit selected. Exiting...
    exit /b
) else if errorlevel 2 (
    call :reset_repo
    exit /b
) else if errorlevel 1 (
    call :pull_repo
    exit /b
)

:pull_repo
REM Pull Git Repository
echo Pulling repository
cd %1
git pull
goto :eof

:reset_repo
REM Hard Reset Repository
set /p "password=Enter the password for hard reset: "
if "%password%"=="hardreset" (
    echo Resetting repo
    cd %1
    git reset --hard
    git pull
) else (
    echo Incorrect password. Operation canceled.
)
goto :eof