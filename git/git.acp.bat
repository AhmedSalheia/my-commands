@echo off

IF [%1]==[] goto haltbranch
IF [%2]==[] goto haltmsg

set message=%2
set message=%message:"=%
set filename=.gitCommitMessage

findstr /m "%filename%" .gitignore

if %errorlevel%==1 (
    echo %filename% >> .gitignore
)

echo %message% > %filename%

git add *
git commit -F %filename%
git push origin %1

goto :EOF

:haltmsg
echo No Message Provided
goto :EOF

:haltbranch
echo No Branch Provided
goto :EOF