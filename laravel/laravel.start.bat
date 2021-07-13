@echo off

CALL composer install
CALL npm install
copy .env.example .env
CALL artisan key:generate
.env
CALL db.reset