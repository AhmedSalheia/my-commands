@echo off

set filePath=%~dp0
if "%1" equ "/?" (
    CALL register
    goto :EOF
) else if "%1" equ "" (
    echo    register [options]
    echo        call this command to register the files required to your Paths variable
    echo.
    echo    options:
    echo        - /?: to show this dialog
    echo        - main:    to register main command's file.
    echo        - git:     to register git command's file.
    echo        - laravel: to register laravel command's file.
    echo        - vue:     to register vue command's file.
    echo        - all:     to register all command files.
    echo.
    goto :EOF
) else if "%1" equ "all" (
    CALL register main
    CALL register git
    CALL register laravel
    CALL register vue
    goto :EOF
) else (
    goto %1
)

:main
set Path | find "%filePath%">NUL
IF ERRORLEVEL 1 (
    setx path "%path%;%filePath%"
    cmd /c "exit /b 0"
) else (
    echo    main file Path already in the PATH variable, processding
)
goto :EOF

:git
set Path | find "%filePath%git">NUL
IF ERRORLEVEL 1 (
    setx path "%path%;%filePath%git"
    cmd /c "exit /b 0"
) else (
    echo    git file Path already in the PATH variable, processding
)
goto :EOF

:laravel
set Path | find "%filePath%laravel">NUL
IF ERRORLEVEL 1 (
    setx path "%path%;%filePath%laravel"
    cmd /c "exit /b 0"
) else (
    echo    laravel file Path already in the PATH variable, processding
)
goto :EOF

:vue
set Path | find "%filePath%vue">NUL
IF ERRORLEVEL 1 (
    setx path "%path%;%filePath%vue"
    cmd /c "exit /b 0"
) else (
    echo    vue file Path already in the PATH variable, processding
)
goto :EOF