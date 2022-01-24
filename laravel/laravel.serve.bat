@echo off
set rev=%*
if /I "%rev:--websocket=%" neq "%rev%" (
    CALL start "" "artisan" websocket:serve    
) 
if /I "%rev:--queue=%" neq "%rev%" (
    CALL start "" "artisan" queue:listen
)
artisan serve