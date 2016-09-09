@echo off
color ac
:main
set sq=0
set neq=%1
if "%neq%"=="" set neq=0
call :setxx
call :v
echo EOF&pause
exit

:setxx
if %neq%==-1 set neq=1&call :snr
if %neq%==1 exit /b
echo "r" for random
set /p n=set xxxx num:
if "%n%"=="r" set n.e=1&call :snr
set /a n=n
if "%n%"=="" echo Error number!(0)&goto setxx
if %neq%==-1 cls&exit /b

set n1=%n:~0,1%
set n2=%n:~1,1%
set n3=%n:~2,1%
set n4=%n:~3,1%
if "%n1%"==""  echo Error number!(4)&goto setxx
if "%n2%"==""  echo Error number!(4)&goto setxx
if "%n3%"==""  echo Error number!(4)&goto setxx
if "%n4%"==""  echo Error number!(4)&goto setxx
if not %n1%%n2%%n3%%n4%==%n% echo Error number!(4)&goto setxx
if %n1%==%n2% echo Error number!(2)&goto setxx
if %n1%==%n3% echo Error number!(2)&goto setxx
if %n1%==%n4% echo Error number!(2)&goto setxx
if %n2%==%n3% echo Error number!(2)&goto setxx
if %n2%==%n4% echo Error number!(2)&goto setxx
if %n3%==%n4% echo Error number!(2)&goto setxx
cls
exit /b

:v
set /a sq=%sq%+1
set cow=0
set bk=0
set /p ss="Vvedi 4islo:"
set /a ss=ss
if "%ss%"=="" echo Error number!(0)&goto setxx
if %ss%=="" echo Error number!(0)&&set /a sq=%sq%-1&&goto v
if %ss%==%n% goto win
if %ss%==q goto lose
set ss1=%ss:~0,1%
set ss2=%ss:~1,1%
set ss3=%ss:~2,1%
set ss4=%ss:~3,1%
if not %ss1%%ss2%%ss3%%ss4%==%ss% echo Error number!(4)&set /a sq=%sq%-1&&goto v
if "%ss1%"=="" echo Error number!(1)&set /a sq=%sq%-1&&goto v
if "%ss2%"=="" echo Error number!(1)&set /a sq=%sq%-1&&goto v
if "%ss3%"=="" echo Error number!(1)&set /a sq=%sq%-1&&goto v
if "%ss4%"=="" echo Error number!(1)&set /a sq=%sq%-1&&goto v


if %ss1%==%ss2%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss1%==%ss3%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss1%==%ss4%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss2%==%ss3%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss2%==%ss4%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss3%==%ss4%  echo Error number!(2)&set /a sq=%sq%-1&&goto v
if %ss1%==%n1% set /a bk=%bk%+1
if %ss1%==%n2% set /a cow=%cow%+1
if %ss1%==%n3% set /a cow=%cow%+1
if %ss1%==%n4% set /a cow=%cow%+1
if %ss2%==%n1% set /a cow=%cow%+1
if %ss2%==%n2% set /a bk=%bk%+1
if %ss2%==%n3% set /a cow=%cow%+1
if %ss2%==%n4% set /a cow=%cow%+1
if %ss3%==%n1% set /a cow=%cow%+1
if %ss3%==%n2% set /a cow=%cow%+1
if %ss3%==%n3% set /a bk=%bk%+1
if %ss3%==%n4% set /a cow=%cow%+1
if %ss4%==%n1% set /a cow=%cow%+1
if %ss4%==%n2% set /a cow=%cow%+1
if %ss4%==%n3% set /a cow=%cow%+1
if %ss4%==%n4% set /a bk=%bk%+1
echo BK=%bk%                    Cow=%cow%
echo.
goto v

:win
set ran= 
if %neq%==1 set ran=for random num
set /a sq=%sq%
color 93
echo YOU WIN!!!!
echo %sq% moves %ran% 
pause
call :restart
:lose
echo You lose:(&echo number was %n%&pause
call :restart

:snr
set /a n1=%random% %%9
set /a n2=%random% %%9
set /a n3=%random% %%9
set /a n4=%random% %%9
:checkn
if %n1%==%n2% set /a n1=%random% %%9&goto checkn
if %n1%==%n3% set /a n1=%random% %%9&goto checkn
if %n1%==%n4% set /a n1=%random% %%9&goto checkn
if %n2%==%n3% set /a n2=%random% %%9&goto checkn
if %n2%==%n4% set /a n2=%random% %%9&goto checkn
if %n3%==%n4% set /a n3=%random% %%9&goto checkn
set n=%n1%%n2%%n3%%n4%
exit /b

:restart
rem dont work now(
exit