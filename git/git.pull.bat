@echo off

FOR /F "tokens=*" %%i IN ('git rev-parse --abbrev-ref HEAD') DO  set branch=%%i

git pull origin %branch%

set /p choice= Do you want to reset Database?[y/n] 
if not '%choice%'=='' set choice=%choice:~0,1%
goto :%choice%

:y
echo yes
db.reset
goto :EOF

:n
goto :EOF