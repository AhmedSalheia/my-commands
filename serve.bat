@echo off

if exist "vendor" (
    set for=laravel
    goto call
) else if exist "node_modules" (
    set for=vue
    goto call
) else (
    echo [1] Laravel
    echo [2] Vue
    choice /c 12
    goto %ERRORLEVEL%

)

:1
set for=laravel
goto call

:2
set for=vue
goto call

:call
CALL %for%.serve
goto :EOF