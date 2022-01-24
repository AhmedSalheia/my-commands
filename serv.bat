@echo off

if exist "vendor" (
    laravel.serve %*
    goto :EOF
) else if exist "node_modules" (
    vue.serve %*
    goto :EOF
) else (
    goto serve %*
    goto :EOF
)