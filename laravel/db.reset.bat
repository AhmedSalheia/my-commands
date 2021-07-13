@echo off
CALL artisan db:wipe
CALL artisan migrate
CALL artisan db:seed