# TerminalFix - Configurador de Equipos Escolares

Herramienta en Batch para Windows destinada a facilitar la **configuración y nomenclatura de equipos escolares**, desarrollada por **TerminalFix**.

El script permite generar automáticamente el nombre de un equipo de acuerdo con la institución, distrito, tipo de equipamiento y número de equipo.

> **Alcance actual:** Región Educativa 7 de la Provincia de Buenos Aires.

---

## Región Educativa 7

Esta versión contempla los siguientes distritos:

| Código | Distrito        |
| ------ | --------------- |
| `SM`   | San Martín      |
| `TDF`  | Tres de Febrero |
| `H`    | Hurlingham      |

La nomenclatura utilizada en el script corresponde específicamente a estos distritos.

Para utilizar la herramienta en otras Regiones Educativas será necesario adaptar los distritos y sus códigos correspondientes.

---

## Instituciones

El script contempla cinco tipos de instituciones:

| Código | Institución                             |
| ------ | --------------------------------------- |
| `J`    | Jardín                                  |
| `EP`   | Escuela Primaria                        |
| `EES`  | Escuela Secundaria                      |
| `EEST` | Escuela de Educación Secundaria Técnica |
| `EEE`  | Escuela de Educación Especial           |

---

## Tipos de equipamiento

### Jardín

* `AC` — Aprender Conectados
* `PRI` — Prini

Ejemplos:

```text
J15-SM-AC01
J15-SM-PRI01
```

### Primaria

* `PAD` — PAD
* `ADM` — Administrativo

Ejemplos:

```text
EP47-SM-PAD01
EP47-SM-ADM01
```

### Secundaria

* `CI` — Conectar Igualdad
* `CIB` — Conectar Igualdad Bonaerense
* `JM` — Juana Manso
* `AC` — Aprender Conectados

Ejemplos:

```text
EES43-SM-CI01
EES43-SM-CIB01
EES43-SM-JM01
EES43-SM-AC01
```

### Técnica

Las Escuelas de Educación Secundaria Técnica utilizan el mismo esquema de equipamiento que las escuelas secundarias.

Ejemplos:

```text
EEST5-TDF-CI01
EEST5-TDF-CIB01
EEST5-TDF-JM01
EEST5-TDF-AC01
```

### Educación Especial

Las Escuelas de Educación Especial utilizan el mismo esquema de equipamiento contemplado para Secundaria y Técnica.

Ejemplos:

```text
EEE12-H-CI01
EEE12-H-CIB01
EEE12-H-JM01
EEE12-H-AC01
```

---

## Formato del nombre

El nombre generado utiliza la siguiente estructura:

```text
INSTITUCION-DISTRITO-EQUIPO
```

Por ejemplo:

```text
EES43-SM-CIB02
```

corresponde a:

* `EES` → Escuela de Educación Secundaria
* `43` → número de institución
* `SM` → San Martín
* `CIB` → Conectar Igualdad Bonaerense
* `02` → número de equipo

---

## Características

* Generación automática del nombre del equipo.
* Selección del tipo de institución.
* Selección del distrito.
* Selección del tipo de equipamiento.
* Numeración individual de equipos.
* Comprobación de privilegios de administrador.
* Cambio automático del nombre de Windows.
* Configuración de memoria virtual.
* Reinicio automático después de completar la configuración.
* Compatible con equipos antiguos con Windows.

---

## Requisitos

El script está pensado principalmente para equipos escolares con:

* Windows 7
* Windows 8
* Windows 8.1
* Windows 10

### Privilegios

Debe ejecutarse con **permisos de Administrador**.

Si el script no se ejecuta como administrador, mostrará un aviso y finalizará.

---

## Uso

1. Descargar o clonar el repositorio.
2. Ejecutar `configurador-inicial.bat`.
3. Seleccionar el tipo de institución.
4. Ingresar el número de institución.
5. Seleccionar el distrito.
6. Seleccionar el tipo de equipamiento.
7. Ingresar el número de equipo.
8. Verificar el nombre generado.
9. Confirmar y permitir que el equipo se reinicie.

---

## Memoria virtual

El script desactiva la administración automática del archivo de paginación y configura:

```text
Ram: 2048 MB
Mínimo: 2048 MB
Máximo: 4096 MB

Ram: 4096 MB
Mínimo: 4096 MB
Máximo: 8192 MB

Ram: 8192 MB
Mínimo: 8192 MB
Máximo: 16384 MB
```

utilizando:

```text
C:\pagefile.sys
```

Esta configuración está orientada principalmente a equipos escolares con recursos limitados.

---

## Advertencia

Este script modifica configuraciones del sistema, incluyendo:

* Nombre del equipo.
* Configuración del archivo de paginación.
* Registro de Windows.
* Reinicio del sistema.

Se recomienda verificar los datos ingresados antes de continuar.

El usuario es responsable de comprobar que la nomenclatura utilizada corresponda a los criterios de su institución o Región Educativa.

---

## Alcance

La versión actual fue desarrollada específicamente para la **Región Educativa 7 de la Provincia de Buenos Aires**.

Los códigos de distrito incluidos son:

```text
SM
TDF
H
```

El proyecto puede ampliarse posteriormente para contemplar otras Regiones Educativas y sus respectivas nomenclaturas.

---

## Autor

**TerminalFix**

Herramientas, scripts y documentación relacionados con administración de sistemas, software libre, infraestructura y soporte técnico.

---

## Licencia

Este proyecto se distribuye bajo la licencia **MIT**.

Ver el archivo [LICENSE](LICENSE) para consultar el texto completo de la licencia.
