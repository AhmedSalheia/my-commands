@echo off
@setlocal enableextensions enabledelayedexpansion
if "%1" equ "" (
    goto :haltFileNotProvided
)

set filename=%1

if exist %filename% (
    
    for /f "tokens=*" %%i in ('Type %filename%') do ()

    set content
    endlocal
    goto :EOF

) else (
    goto :haltFileNotExists
)
:haltFileNotProvided
echo no file provided
endlocal
goto :EOF

:haltFileNotExists
echo provided file not exists
endlocal
goto :EOF