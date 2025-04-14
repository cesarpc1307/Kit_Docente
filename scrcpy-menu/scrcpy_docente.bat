@echo off
title scrcpy - Herramientas Docentes
chcp 65001 >nul

:inicio
goto menu

:menu
cls
echo ===========================================================
echo   Herramienta para proyectar/controlar celular con SCRCPY
echo ===========================================================
echo.
echo --------------------- MENU PRINCIPAL ---------------------
echo 1. Modo normal por USB
echo 2. Pantalla completa
echo 3. Solo visualizar (sin control)
echo 4. Conectar por Wi-Fi
echo 5. Grabar clase (visualizando el celular)
echo 6. Apagar pantalla del celular mientras proyecta
echo 7. Ventana flotante (sin bordes)
echo 8. Salir
echo ----------------------------------------------------------
set /p opcion=Seleccione una opcion (1-8): 

if "%opcion%"=="1" cls & scrcpy & goto volver
if "%opcion%"=="2" cls & scrcpy --fullscreen & goto volver
if "%opcion%"=="3" cls & scrcpy --no-control & goto volver
if "%opcion%"=="4" goto submenu4
if "%opcion%"=="5" goto submenu5
if "%opcion%"=="6" goto submenu6
if "%opcion%"=="7" goto submenu7
if "%opcion%"=="8" (
    cls
    echo Cerrando... Gracias por usar esta herramienta docente.
    timeout /t 2 >nul
    exit
)

cls
echo Opcion invalida. Intente de nuevo.
pause
goto menu

:submenu4
cls
echo ========= CONEXIÓN POR Wi-Fi =========
echo Ingrese la IP del celular (ej. 192.168.1.100)
echo Escriba Q para cancelar
echo.
set /p ip=IP: 
if /I "%ip%"=="Q" cls & goto menu
if "%ip%"=="" cls & goto menu
echo Conectando a %ip%...
adb connect %ip%
if errorlevel 1 (
    echo Error al conectar. Verifique la IP y que ADB Wi-Fi esté activado.
    pause
    goto menu
)
scrcpy
adb usb
goto volver

:submenu5
cls
echo ==== GRABAR CLASE ====
echo ¿Desde dónde desea grabar?
echo 1. USB
echo 2. Wi-Fi
echo Q. Cancelar
echo.
set /p modo=Seleccione una opcion (1/2/Q): 
if /I "%modo%"=="Q" cls & goto menu

:: Crear carpeta Grabaciones si no existe
if not exist "Grabaciones" mkdir Grabaciones

:: Generar nombre único con fecha y hora
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HHmmss"') do set timestamp=%%i
set filename=Grabaciones\grabacion_%timestamp%.mp4

if "%modo%"=="1" (
    cls
    scrcpy --record %filename%
    goto volver
)
if "%modo%"=="2" (
    cls
    echo Ingrese la IP del celular (ej. 192.168.1.100)
    echo Escriba Q para cancelar
    set /p ip=IP: 
    if /I "%ip%"=="Q" cls & goto menu
    if "%ip%"=="" cls & goto menu
    adb connect %ip%
    scrcpy --record %filename%
    adb usb
    goto volver
)
goto submenu5

:submenu6
cls
echo ==== APAGAR PANTALLA DEL CELULAR ====
echo ¿Desde dónde desea proyectar?
echo 1. USB
echo 2. Wi-Fi
echo Q. Cancelar
echo.
set /p modo=Seleccione una opcion (1/2/Q): 
if /I "%modo%"=="Q" cls & goto menu
if "%modo%"=="1" (
    cls
    scrcpy --turn-screen-off
    goto volver
)
if "%modo%"=="2" (
    cls
    echo Ingrese la IP del celular (ej. 192.168.1.100)
    echo Escriba Q para cancelar
    set /p ip=IP: 
    if /I "%ip%"=="Q" cls & goto menu
    if "%ip%"=="" cls & goto menu
    adb connect %ip%
    scrcpy --turn-screen-off
    adb usb
    goto volver
)
goto submenu6

:submenu7
cls
echo ==== VENTANA FLOTANTE (SIN BORDES) ====
echo ¿Desde dónde desea proyectar?
echo 1. USB
echo 2. Wi-Fi
echo Q. Cancelar
echo.
set /p modo=Seleccione una opcion (1/2/Q): 
if /I "%modo%"=="Q" cls & goto menu
if "%modo%"=="1" (
    cls
    scrcpy --window-borderless
    goto volver
)
if "%modo%"=="2" (
    cls
    echo Ingrese la IP del celular (ej. 192.168.1.100)
    echo Escriba Q para cancelar
    set /p ip=IP: 
    if /I "%ip%"=="Q" cls & goto menu
    if "%ip%"=="" cls & goto menu
    adb connect %ip%
    scrcpy --window-borderless
    adb usb
    goto volver
)
goto submenu7

:volver
echo.
pause
goto menu
