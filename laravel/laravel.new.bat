@echo off

IF [%1]==[] goto halt


CALL laravel new %1

SET /p multi=Do You Want It To be Multi Language(y,n)?
@FOR /F "tokens=*" %%i IN ('convertStringCase %multi% lower') DO set multi=%%i

IF [%multi%] == [y] (
    CALL composer require mcamara/laravel-localization
    CALL artisan vendor:publish --provider="Mcamara\LaravelLocalization\LaravelLocalizationServiceProvider"
)

SET /p ui=Do You Want To Use Laravel-ui(y,n)?
@FOR /F "tokens=*" %%i IN ('convertStringCase %ui% lower') DO set ui=%%i

IF [%ui%] == [y] (
    CALL composer require laravel/ui

    SET /p auth=Creat Default Auth with {vue,bootstrap,react,enter to skip}:
    IF [%auth%]==[] goto out

    @FOR /F "tokens=*" %%i IN ('convertStringCase %auth% lower') DO set auth=%%i
    IF [%auth%]==[bootstrap] (
        set authVal=true
    ) ELSE (
        IF [%auth%]==[vue] (
            set authVal=true
        ) ELSE (
            IF [%auth%]==[react] (
                set authVal=true
            )
        )
    )
    IF [%authVal%]==[true] (
        CALL artisan ui %auth% --auth
    )
)
:out
GOTO:EOF

:halt
echo No Project Name Provided
GOTO:EOF