```bat
@echo off
color 0A
title Configurador de Equipos Escolares - Region Educativa 7

:: =====================================================
:: CONFIGURADOR DE EQUIPOS ESCOLARES
:: REGION EDUCATIVA 7 - PROVINCIA DE BUENOS AIRES
::
:: Distritos:
:: SM  - San Martin
:: TDF - Tres de Febrero
:: H   - Hurlingham
::
:: Instituciones:
:: J    - Jardin
:: EP   - Primaria
:: EES  - Secundaria
:: EEST - Tecnica
:: EEE  - Educacion Especial
::
:: Compatible con Windows 7, 8, 8.1 y 10
:: =====================================================


:: =====================================================
:: COMPROBAR PRIVILEGIOS DE ADMINISTRADOR
:: =====================================================

net session >nul 2>&1

if %errorlevel% neq 0 (
    echo.
    echo ============================================
    echo       ERROR: SE REQUIEREN PRIVILEGIOS
    echo             DE ADMINISTRADOR
    echo ============================================
    echo.
    echo Ejecute este archivo como Administrador.
    echo.
    pause
    exit /b
)


:: =====================================================
:: TIPO DE INSTITUCION
:: =====================================================

:TIPO_INSTITUCION

cls

echo ============================================
echo     CONFIGURADOR DE EQUIPOS ESCOLARES
echo            REGION EDUCATIVA 7
echo ============================================
echo.
echo TIPO DE INSTITUCION
echo.
echo 1 - Jardin
echo 2 - Primaria
echo 3 - Secundaria
echo 4 - Tecnica
echo 5 - Educacion Especial
echo.

set "PREFIJO="
set /p TIPO=Seleccione opcion: 

if "%TIPO%"=="1" (
    set "PREFIJO=J"
    goto NUMERO_INSTITUCION
)

if "%TIPO%"=="2" (
    set "PREFIJO=EP"
    goto NUMERO_INSTITUCION
)

if "%TIPO%"=="3" (
    set "PREFIJO=EES"
    goto NUMERO_INSTITUCION
)

if "%TIPO%"=="4" (
    set "PREFIJO=EEST"
    goto NUMERO_INSTITUCION
)

if "%TIPO%"=="5" (
    set "PREFIJO=EEE"
    goto NUMERO_INSTITUCION
)

echo.
echo Opcion invalida.
pause
goto TIPO_INSTITUCION


:: =====================================================
:: NUMERO DE INSTITUCION
:: =====================================================

:NUMERO_INSTITUCION

cls

echo ============================================
echo            NUMERO DE INSTITUCION
echo ============================================
echo.

set "NUMERO="
set /p NUMERO=Ingrese numero de institucion: 

if not defined NUMERO (
    echo.
    echo Debe ingresar un numero de institucion.
    pause
    goto NUMERO_INSTITUCION
)


:: =====================================================
:: DISTRITO
:: =====================================================

:DISTRITO

cls

echo ============================================
echo               DISTRITO
echo ============================================
echo.
echo 1 - San Martin
echo 2 - Tres de Febrero
echo 3 - Hurlingham
echo.

set "DISTRITO="
set /p DIST=Seleccione opcion: 

if "%DIST%"=="1" (
    set "DISTRITO=SM"
    goto TIPO_EQUIPO
)

if "%DIST%"=="2" (
    set "DISTRITO=TDF"
    goto TIPO_EQUIPO
)

if "%DIST%"=="3" (
    set "DISTRITO=H"
    goto TIPO_EQUIPO
)

echo.
echo Opcion invalida.
pause
goto DISTRITO


:: =====================================================
:: TIPO DE EQUIPO
:: =====================================================

:TIPO_EQUIPO

cls

echo ============================================
echo             TIPO DE EQUIPO
echo ============================================
echo.


:: =====================================================
:: JARDIN
:: =====================================================

if "%TIPO%"=="1" (
    echo 1 - Aprender Conectados
    echo 2 - Prini
    echo.

    set "SECTOR="
    set /p AREA=Seleccione opcion: 

    if "%AREA%"=="1" set "SECTOR=AC"
    if "%AREA%"=="2" set "SECTOR=PRI"

    if not defined SECTOR (
        echo.
        echo Opcion invalida.
        pause
        goto TIPO_EQUIPO
    )

    goto NUMERO_EQUIPO
)


:: =====================================================
:: PRIMARIA
:: =====================================================

if "%TIPO%"=="2" (
    echo 1 - PAD
    echo 2 - ADM
    echo.

    set "SECTOR="
    set /p AREA=Seleccione opcion: 

    if "%AREA%"=="1" set "SECTOR=PAD"
    if "%AREA%"=="2" set "SECTOR=ADM"

    if not defined SECTOR (
        echo.
        echo Opcion invalida.
        pause
        goto TIPO_EQUIPO
    )

    goto NUMERO_EQUIPO
)


:: =====================================================
:: SECUNDARIA / TECNICA / EDUCACION ESPECIAL
:: =====================================================

if "%TIPO%"=="3" goto EQUIPO_SECUNDARIA
if "%TIPO%"=="4" goto EQUIPO_SECUNDARIA
if "%TIPO%"=="5" goto EQUIPO_SECUNDARIA


:EQUIPO_SECUNDARIA

echo 1 - Conectar Igualdad
echo 2 - Conectar Igualdad Bonaerense
echo 3 - Juana Manso
echo 4 - Aprender Conectados
echo.

set "SECTOR="
set /p AREA=Seleccione opcion: 

if "%AREA%"=="1" set "SECTOR=CI"
if "%AREA%"=="2" set "SECTOR=CIB"
if "%AREA%"=="3" set "SECTOR=JM"
if "%AREA%"=="4" set "SECTOR=AC"

if not defined SECTOR (
    echo.
    echo Opcion invalida.
    pause
    goto TIPO_EQUIPO
)


:: =====================================================
:: NUMERO DE EQUIPO
:: =====================================================

:NUMERO_EQUIPO

cls

echo ============================================
echo             NUMERO DE EQUIPO
echo ============================================
echo.
echo Ejemplo: 01
echo.

set "PCNUM="
set /p PCNUM=Ingrese numero de equipo: 

if not defined PCNUM (
    echo.
    echo Debe ingresar un numero de equipo.
    pause
    goto NUMERO_EQUIPO
)


:: =====================================================
:: GENERAR NOMBRE
:: =====================================================

set "NUEVO_NOMBRE=%PREFIJO%%NUMERO%-%DISTRITO%-%SECTOR%%PCNUM%"


:: =====================================================
:: MOSTRAR RESULTADO
:: =====================================================

cls

echo ============================================
echo             RESULTADO FINAL
echo ============================================
echo.
echo Region educativa : 7
echo Institucion      : %PREFIJO%%NUMERO%
echo Distrito         : %DISTRITO%
echo Tipo de equipo   : %SECTOR%%PCNUM%
echo.
echo Nombre actual    : %COMPUTERNAME%
echo Nombre nuevo     : %NUEVO_NOMBRE%
echo.
echo ============================================
echo.

pause


:: =====================================================
:: CAMBIAR NOMBRE DEL EQUIPO
:: =====================================================

echo.
echo Cambiando nombre del equipo...
echo.

wmic computersystem where name="%COMPUTERNAME%" call rename name="%NUEVO_NOMBRE%" >nul

if %errorlevel% neq 0 (
    echo ERROR: No se pudo cambiar el nombre del equipo.
    echo.
    pause
    exit /b
)

echo Nombre cambiado correctamente.


:: =====================================================
:: CONFIGURAR MEMORIA VIRTUAL
:: =====================================================

echo.
echo Configurando memoria virtual...
echo.

wmic computersystem where name="%COMPUTERNAME%" set AutomaticManagedPagefile=False >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" ^
/v PagingFiles /t REG_MULTI_SZ /d "C:\pagefile.sys 8192 16384" /f >nul

if %errorlevel% neq 0 (
    echo ERROR: No se pudo configurar la memoria virtual.
    echo.
    pause
    exit /b
)

echo Memoria virtual configurada:
echo.
echo Minimo : 8192 MB
echo Maximo : 16384 MB


:: =====================================================
:: FINAL
:: =====================================================

echo.
echo ============================================
echo       CONFIGURACION COMPLETADA
echo ============================================
echo.
echo Nombre del equipo:
echo %NUEVO_NOMBRE%
echo.
echo El equipo se reiniciara en 15 segundos.
echo.
echo Guarde su trabajo antes de continuar.
echo ============================================
echo.

timeout /t 15 /nobreak >nul

shutdown /r /t 0
```
