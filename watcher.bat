@echo off

if "%1" equ "" (
    set file=%cd%
) else (
    set file=%1
)

IF EXIST %file%\* (
    
    :loopOut
    timeout -t 1 >nul
    for /f "tokens=*" %%i in ('dir /b /s /a-d %~dp1%file% ^| findstr /v /i "node_modules/* | .git/*"') do (
        for %%a in (%%i) do (
            
            echo %%~aa|find /I /C "-----------">nul || ( echo [%%i] : changed : %date% : %time% & attrib -a %%a)

        )
    )
    goto :loopOut

) else (

    :loop1
    timeout -t 1 >nul
    for %%i in (%~dp1%file%) do (
        echo %%~ai|find "a">nul || goto :loop1

        echo [%%i] : changed : %date% : %time%
        rem do workload
        attrib -a %%i
    )
    goto :loop1

)