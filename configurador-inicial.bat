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

if errorlevel 1 goto ERROR_ADMIN


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
set "TIPO="
set /p TIPO=Seleccione opcion: 

if "%TIPO%"=="1" goto TIPO_JARDIN
if "%TIPO%"=="2" goto TIPO_PRIMARIA
if "%TIPO%"=="3" goto TIPO_SECUNDARIA
if "%TIPO%"=="4" goto TIPO_TECNICA
if "%TIPO%"=="5" goto TIPO_ESPECIAL

echo.
echo Opcion invalida.
pause
goto TIPO_INSTITUCION


:TIPO_JARDIN
set "PREFIJO=J"
goto NUMERO_INSTITUCION


:TIPO_PRIMARIA
set "PREFIJO=EP"
goto NUMERO_INSTITUCION


:TIPO_SECUNDARIA
set "PREFIJO=EES"
goto NUMERO_INSTITUCION


:TIPO_TECNICA
set "PREFIJO=EEST"
goto NUMERO_INSTITUCION


:TIPO_ESPECIAL
set "PREFIJO=EEE"
goto NUMERO_INSTITUCION


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
set "DIST="
set /p DIST=Seleccione opcion: 

if "%DIST%"=="1" goto DISTRITO_SM
if "%DIST%"=="2" goto DISTRITO_TDF
if "%DIST%"=="3" goto DISTRITO_H

echo.
echo Opcion invalida.
pause
goto DISTRITO


:DISTRITO_SM
set "DISTRITO=SM"
goto TIPO_EQUIPO


:DISTRITO_TDF
set "DISTRITO=TDF"
goto TIPO_EQUIPO


:DISTRITO_H
set "DISTRITO=H"
goto TIPO_EQUIPO


:: =====================================================
:: TIPO DE EQUIPO
:: =====================================================

:TIPO_EQUIPO

cls

echo ============================================
echo             TIPO DE EQUIPO
echo ============================================
echo.

if "%TIPO%"=="1" goto EQUIPO_JARDIN
if "%TIPO%"=="2" goto EQUIPO_PRIMARIA
if "%TIPO%"=="3" goto EQUIPO_SECUNDARIA
if "%TIPO%"=="4" goto EQUIPO_SECUNDARIA
if "%TIPO%"=="5" goto EQUIPO_SECUNDARIA

goto TIPO_INSTITUCION


:: =====================================================
:: JARDIN
:: =====================================================

:EQUIPO_JARDIN

echo 1 - Aprender Conectados
echo 2 - Prini
echo.

set "SECTOR="
set "AREA="
set /p AREA=Seleccione opcion: 

if "%AREA%"=="1" goto JARDIN_AC
if "%AREA%"=="2" goto JARDIN_PRI

echo.
echo Opcion invalida.
pause
goto EQUIPO_JARDIN


:JARDIN_AC
set "SECTOR=AC"
goto NUMERO_EQUIPO


:JARDIN_PRI
set "SECTOR=PRI"
goto NUMERO_EQUIPO


:: =====================================================
:: PRIMARIA
:: =====================================================

:EQUIPO_PRIMARIA

echo 1 - PAD
echo 2 - ADM
echo.

set "SECTOR="
set "AREA="
set /p AREA=Seleccione opcion: 

if "%AREA%"=="1" goto PRIMARIA_PAD
if "%AREA%"=="2" goto PRIMARIA_ADM

echo.
echo Opcion invalida.
pause
goto EQUIPO_PRIMARIA


:PRIMARIA_PAD
set "SECTOR=PAD"
goto NUMERO_EQUIPO


:PRIMARIA_ADM
set "SECTOR=ADM"
goto NUMERO_EQUIPO


:: =====================================================
:: SECUNDARIA / TECNICA / EDUCACION ESPECIAL
:: =====================================================

:EQUIPO_SECUNDARIA

echo 1 - Conectar Igualdad
echo 2 - Conectar Igualdad Bonaerense
echo 3 - Juana Manso
echo 4 - Aprender Conectados
echo.

set "SECTOR="
set "AREA="
set /p AREA=Seleccione opcion: 

if "%AREA%"=="1" goto SECUNDARIA_CI
if "%AREA%"=="2" goto SECUNDARIA_CIB
if "%AREA%"=="3" goto SECUNDARIA_JM
if "%AREA%"=="4" goto SECUNDARIA_AC

echo.
echo Opcion invalida.
pause
goto EQUIPO_SECUNDARIA


:SECUNDARIA_CI
set "SECTOR=CI"
goto NUMERO_EQUIPO


:SECUNDARIA_CIB
set "SECTOR=CIB"
goto NUMERO_EQUIPO


:SECUNDARIA_JM
set "SECTOR=JM"
goto NUMERO_EQUIPO


:SECUNDARIA_AC
set "SECTOR=AC"
goto NUMERO_EQUIPO


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

if errorlevel 1 goto ERROR_NOMBRE

echo Nombre cambiado correctamente.


:: =====================================================
:: CONFIGURAR MEMORIA VIRTUAL SEGUN RAM
:: =====================================================

echo.
echo Detectando memoria RAM...
echo.

set "RAM_BYTES="
set "RAM_GB="
set "PAGE_MIN="
set "PAGE_MAX="

for /f "skip=1" %%A in ('wmic computersystem get TotalPhysicalMemory') do (
    if not defined RAM_BYTES set "RAM_BYTES=%%A"
)

if not defined RAM_BYTES goto ERROR_RAM

set /a RAM_GB=RAM_BYTES/1024/1024/1024

echo Memoria RAM detectada : %RAM_GB% GB
echo.


:: =====================================================
:: ASIGNAR MEMORIA VIRTUAL
:: =====================================================

if "%RAM_GB%"=="1" goto RAM_1GB
if "%RAM_GB%"=="2" goto RAM_2GB
if "%RAM_GB%"=="4" goto RAM_4GB
if "%RAM_GB%"=="8" goto RAM_8GB

goto ERROR_RAM_NO_COMPATIBLE


:RAM_1GB
set "PAGE_MIN=1024"
set "PAGE_MAX=2048"
goto CONFIGURAR_PAGEFILE


:RAM_2GB
set "PAGE_MIN=2048"
set "PAGE_MAX=4096"
goto CONFIGURAR_PAGEFILE


:RAM_4GB
set "PAGE_MIN=4096"
set "PAGE_MAX=8192"
goto CONFIGURAR_PAGEFILE


:RAM_8GB
set "PAGE_MIN=8192"
set "PAGE_MAX=16384"
goto CONFIGURAR_PAGEFILE


:: =====================================================
:: APLICAR MEMORIA VIRTUAL
:: =====================================================

:CONFIGURAR_PAGEFILE

echo.
echo Configuracion de memoria virtual:
echo.
echo Minimo : %PAGE_MIN% MB
echo Maximo : %PAGE_MAX% MB
echo.

echo Configurando memoria virtual...
echo.

wmic computersystem where name="%COMPUTERNAME%" set AutomaticManagedPagefile=False >nul

if errorlevel 1 goto ERROR_PAGEFILE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" ^
/v PagingFiles /t REG_MULTI_SZ /d "C:\pagefile.sys %PAGE_MIN% %PAGE_MAX%" /f >nul

if errorlevel 1 goto ERROR_PAGEFILE

echo.
echo Memoria virtual configurada correctamente.
echo.
echo Minimo : %PAGE_MIN% MB
echo Maximo : %PAGE_MAX% MB


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
echo Memoria RAM:
echo %RAM_GB% GB
echo.
echo Memoria virtual:
echo %PAGE_MIN% MB - %PAGE_MAX% MB
echo.
echo El equipo se reiniciara en 15 segundos.
echo.
echo Guarde su trabajo antes de continuar.
echo ============================================
echo.

timeout /t 15 /nobreak >nul

shutdown /r /t 0

exit /b


:: =====================================================
:: ERRORES
:: =====================================================

:ERROR_ADMIN

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


:ERROR_NOMBRE

echo.
echo ============================================
echo       ERROR AL CAMBIAR EL NOMBRE
echo ============================================
echo.
echo No se pudo cambiar el nombre del equipo.
echo.
pause
exit /b


:ERROR_RAM

echo.
echo ============================================
echo       ERROR AL DETECTAR LA MEMORIA RAM
echo ============================================
echo.
echo No se pudo determinar la memoria RAM instalada.
echo La configuracion de memoria virtual no se modificara.
echo.
pause
exit /b


:ERROR_RAM_NO_COMPATIBLE

echo.
echo ============================================
echo       MEMORIA RAM NO CONTEMPLADA
echo ============================================
echo.
echo RAM detectada: %RAM_GB% GB
echo.
echo Este configurador contempla equipos de:
echo 1 GB, 2 GB, 4 GB y 8 GB de RAM.
echo.
echo La configuracion de memoria virtual no se modificara.
echo.
pause
exit /b


:ERROR_PAGEFILE

echo.
echo ============================================
echo       ERROR AL CONFIGURAR MEMORIA VIRTUAL
echo ============================================
echo.
echo No se pudo configurar el archivo de paginacion.
echo.
pause
exit /b
