@echo off

IF [%1]==[] goto haltmsg

set message=%1
set message=%message:"=%
set filename=.gitCommitMessage

@FOR /F "tokens=*" %%i IN ('git rev-parse --abbrev-ref HEAD') DO  set branch=%%i

findstr /m "%filename%" .gitignore>nul

if %errorlevel%==1 (
    echo %filename% >> .gitignore
)

echo %message% > %filename%

git add .
git commit -F %filename%
git push origin %branch%

goto :EOF

:haltmsg
echo No Message Provided
goto :EOF

:haltbranch
echo No Branch Provided
goto :EOF