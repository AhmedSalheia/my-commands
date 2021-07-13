@echo off

IF [%1]==[] goto haltfrom
IF [%2]==[] goto haltto
IF [%3]==[] set 3=''

php -f "D:\others\MyCommands\php\copyRand.php" %1 %2 %3%
goto :eof

:haltfrom
echo no from Directory provided
goto :eof

:haltto
echo no to Directory provided
goto :eof