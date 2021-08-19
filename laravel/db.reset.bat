@echo off
CALL artisan db:wipe

IF EXIST db.sql (
    
    set /p choice= db file detected, do you want to use it?[y/n] 
    if not '%choice%'=='' set choice=%choice:~0,1%
    goto :%choice%

) ELSE (
    goto :n
)
goto :EOF

:y
for /f "tokens=*" %%i in ('readini .env DB_DATABASE') do set db=%%i
mysql -uroot -h127.0.0.1 %db% < db.sql

echo Database imported successfully
goto :EOF

:n
CALL artisan migrate
CALL artisan db:seed
CALL artisan passport:install --force
goto :EOF