@echo off

IF [%1]==[] (
    set branch=main
) ELSE (
    set branch=%1
)
set origin=%2

@FOR /F "tokens=*" %%i IN ('git config --get remote.origin.url') DO  set o=%%i
if "%o%" equ "" (
    IF [%origin%]==[] goto haltorigin
    
    git init
    git remote add origin %origin%
)
git.acp master "first commit"
goto :EOF

:haltorigin
echo No Origin Link provided
goto :EOF