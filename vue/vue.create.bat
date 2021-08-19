@echo off

IF [%1]==[] goto haltErrNoProjectName
set projectName=%1

@FOR /F "tokens=*" %%i IN ('convertStringCase %projectName% lower') DO set projectName=%%i

if exist %projectName% (
    echo project already exists
    goto :EOF
)

mkdir %projectName%
cd %projectName%

CALL type %~dp0files\.jsconfig > jsconfig.json 

CALL npm ls -g @vue/cli | find "@vue/cli">nul
if [%errorLevel%]==[1] (
    echo isntalling vue-cli globally
    CALL npm i -g @vue/cli
    set errorLevel=0
)

CALL vue create .
CALL npm i normalize.css bootstrap jquery @popperjs/core swiper laravel-echo pusher-js axios @vueuse/head @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/vue-fontawesome nprogress lodash --save

if not exist "src" (
    mkdir src
)
if not exist "src\init" (
    mkdir src\init
)
if not exist "src\global\components" (
    mkdir src\global\components
)
if not exist "src\components\layouts" (
    mkdir src\components\layouts
)
CALL type %~dp0files\.main > src\main.js
CALL type %~dp0files\.init > src\init\index.js
CALL type %~dp0files\.global > src\global\components\globalComponents.js

CALL npm ls -g prettier | find /I /C "prettier" >nul
if [%errorLevel%]==[1] (
    echo isntalling prettier globally
    CALL npm i -g prettier
    set errorLevel=0
)

CALL echo node_modules/ > .prettierignore
CALL prettier --write .

echo Referrences:
echo    swiper:  https://swiperjs.com/vue
echo    vue-meta: https://vue-meta.nuxtjs.org/
echo    fontawesome: https://vuecomponent.com/integrations/fontawesome.html
goto :EOF

:haltErrNoProjectName
echo No Project Name Provided
goto :EOF