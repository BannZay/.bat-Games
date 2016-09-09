@echo off
echo Downloading...
cls
set wtime=%time:~10,1%
if %wtime% gtr 5 set /a wtime=wtime/2
if %wtime%==0 set wtime=1
call :records
echo now record is %record%
echo If u ready press any key
pause >nul
call :wait %wtime%
color 39
echo PRESS !!!
set ctime=%time%
pause>nul
set ltime=%time%
call :calc
echo %result%
if %result% lss %record% Echo it is new record!&echo set record=%result%>>%0
pause
start reaction.bat
exit






:wait
cls
choice /c "P" /t %1 /d P>nul
exit /b

:calc
set cms=%ctime:~9,2%
set csec=%ctime:~6,2%
set cmin=%ctime:~3,2%
set chour=%ctime:~0,2%
if %ctime:~9,1%==0 set cms=%ctime:~10,1%
if %ctime:~6,1%==0 set csec=%ctime:~7,1%
if %ctime:~3,1%==0 set cmin=%ctime:~4,1%
if %ctime:~0,1%==0 set cmin=%ctime:~1,1%
set lms=%ltime:~9,2%
set lsec=%ltime:~6,2%
set lmin=%ltime:~3,2%
set lhour=%ltime:~0,2%
if %ltime:~9,1%==0 set lms=%ctime:~10,1%
if %ltime:~6,1%==0 set lsec=%ltime:~7,1%
if %ltime:~3,1%==0 set lmin=%ltime:~4,1%
if %ltime:~0,1%==0 set lmin=%ltime:~1,1%
if not %chour%==%lhour% goto changehour
if not %cmin%==%lmin% goto changemin
goto raschet
:raschet
set /a csum=(cms)+(csec*100)
set /a lsum=(lms)+(lsec*100)
set /a result=lsum-csum
exit /b
:changemin
set /a csum=(cms)+(csec*100)+(cmin*6000)
set /a lsum=(lms)+(lsec*100)+(lmin*6000)
set /a result=lsum-csum
exit /b
:changehour
set /a csum=(cms)+(csec*100)+(cmin*6000)+(chour*360000)
set /a lsum=(lms)+(lsec*100)+(lmin*6000)+(lhour*360000)
set /a result=lsum-csum
exit /b





:records
set record=3