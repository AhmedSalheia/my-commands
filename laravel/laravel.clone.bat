@echo off

IF [%1]==[] goto halt
IF [%2]==[] goto haltName

set url=%1
set name=%2

CALL git clone %url% %name%

CALL cd %name%
CALL laravel.start
cd ..

goto :EOF

:halt
echo No github url provided
goto :EOF

:haltName
echo No Project Name Provided
goto :EOF