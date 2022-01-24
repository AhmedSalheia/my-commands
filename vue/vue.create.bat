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
CALL npm i normalize.css bootstrap jquery @popperjs/core swiper laravel-echo pusher-js axios @vueuse/head nprogress lodash --save
@REM @fortawesome/vue-fontawesome @fortawesome/free-brands-svg-icons @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons
CALL vue add i18n

if not exist "src" (
    mkdir src
)
if not exist "src\init" (
    mkdir src\init
)
if not exist "src\sass" (
    mkdir src\sass
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
CALL type %~dp0files\.flatIcon > src\components\layouts\FlatIconComponent.vue
CALL echo. > src\assets\style.scss

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
@REM echo    fontawesome: https://vuecomponent.com/integrations/fontawesome.html
goto :EOF

:haltErrNoProjectName
echo No Project Name Provided
goto :EOF

@REM for vue-i18n you must add this to App.vue and then pass it to every view
@REM setup() {
@REM     const { t } = useI18n({
@REM         inheritLocale: true,
@REM         useScope: "local",
@REM     });
@REM     return {
@REM         t,
@REM     };
@REM },

@REM For useing font-awesom, just go add the icons you want to use to the library and then add this when 
@REM you want to use the icon:
@REM 
@REM <font-awesome-icon v-if="!show" :icon="chevronDown" size="1x" />