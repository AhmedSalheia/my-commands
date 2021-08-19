@setlocal enableextensions enabledelayedexpansion
@echo off
set file=%~1
set key=%~2
for /f "usebackq delims=" %%a in ("%file%") do (
    for /f "tokens=1,2 delims==" %%b in ("%%a") do (
        if NOT "x%key%" == "x" (
            if "x%key%"=="x%%b" (
                echo %%c
            )
        ) else (
            if "%%c" == "" (
                echo %%b=
            ) else (
                echo %%b=%%c
            )
        )
    )
)
endlocal