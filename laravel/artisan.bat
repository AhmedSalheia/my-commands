@echo off

IF [%*]==[] goto halt

CALL php artisan %*
goto :EOF


:halt
echo Params Provided
goto :EOF