@echo off
rem vers 1.2
rem source 2.3
title Followme 1.2 .bat
setlocal enabledelayedexpansion
color 24
set t1= /-\ 
set t2=(-_-)
set t3=\   /
set t4=1   1
set t5=_---_
set strick1=cls^&
set k=0
set x=0
set y=0

:show
if "%gout%"=="1" exit /b
%remstrick1% set /a k=k+1
%strick1% echo W - up&echo A - Left&echo S - down&echo D - Right&echo G - Finish&echo C - set color
set xk= 
for /l %%I in (1,1,%x%) do set xk=!xk!       
for /l %%I in (1,1,%y%) do (echo.&echo.&echo.&echo.&echo.)
echo %xk%%t1%
echo %xk%%t2%
echo %xk%%t3%
echo %xk%%t4%
echo %xk%%t5%
%strick2%
:ch
choice /c "WASDGR" /n>nul
if %ERRORLEVEL%==5 goto 2
if %ERRORLEVEL%==1 (
if %y%==0 goto ch
set /a y=%y%-1
set z%k%=W
goto show
)
if %ERRORLEVEL%==2 (
if %x%==0 goto ch
set /a x=%x%-1
set z%k%=A
goto show
)
if %ERRORLEVEL%==3 (
if %y%==9 goto ch
set /a y=%y%+1
set z%k%=S
goto show
)
if %ERRORLEVEL%==4 (
if %x%==9 goto ch
set /a x=%x%+1
set z%k%=D
goto show
)
if %ERRORLEVEL%==6 goto random

:2
if "%mark%"=="3" goto lose
set mark=3
set strick1=rem
set strick2=exit /b
set totalk=%k%
set x=0
set y=0
if %k%==1 goto reshow
set k=0
cls
call :show
:ch2
choice /c "GL" /N /T 1 /D L
if %ERRORLEVEL%==1 goto 3
if %k%==%totalk% goto 3
cls
set wq=!z%k%!
if %wq%==W set /a y=%y%-1&&echo                                   UP
if %wq%==A set /a x=%x%-1&&echo                                  LEFT
if %wq%==S set /a y=%y%+1&&echo                                  DOWN
if %wq%==D set /a x=%x%+1&&echo                                  RIGHT
call :show
goto ch2

:3
title Followme 1.2 .bat - try to follow
set strick2=set gout=1
set remstrick1=rem
set x=0
set y=0
set k=1
:cic3
if %k%==%totalk% goto win
set cz%k%=!z%k%!
set gout=0
cls
call :show
if not !cz%k%!==!z%k%! goto lose
set /a k=k+1
goto cic3
:win
echo win
for /l %%O in (1,1,%totalk%) do (
set k=%%O
set winstr=!winstr! !z%%O!
)
echo Win strick:%winstr%
pause
exit
:lose
for /l %%O in (1,1,%totalk%) do (
set k=%%O
set winstr=!winstr! !z%%O!
)
for /l %%O in (1,1,%totalk%) do (
set k=%%O
set Ustr=!Ustr! !cz%%O!
)
echo Win strick:%winstr%
echo You strick:%Ustr%

echo lose
pause
exit

:reshow
set k=0
set strick1=cls^&
set strick2= 
set mark=1
pause<nul
goto show

:random
set x=1
set y=1
set k=1
set /p totalk=number of moves?:
if "%totalk%"=="" echo incorrect numbers of moves&goto random
if not %totalk% gtr 0 echo incorrect numbers of moves&goto random
:cicr1
set /a rnd=%random% %%4 +1
if %rnd%==1 (
if %y%==1 goto cicr1
set z%k%=W
set /a y=y-1
)
if %rnd%==2 (
if %x%==1 goto cicr1
set z%k%=A
set /a x=x-1
)
if %rnd%==3 (
if %y%==9 goto cicr1
set z%k%=S
set /a y=y+1
)
if %rnd%==4 (
if %x%==9 goto cicr1
set z%k%=D
set /a x=x+1
)
set /a k=k+1
if not %k%==%totalk% goto cicr1
goto 2
