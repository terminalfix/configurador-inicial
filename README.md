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
EEE502-H-CI01
EEE502-H-CIB01
EEE502-H-JM01
EEE502-H-AC01
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
* Diseñado para equipos escolares con diferentes niveles de recursos.

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

El script desactiva la administración automática del archivo de paginación y configura diferentes valores según la cantidad de memoria RAM detectada:

| Memoria RAM |  Mínimo |   Máximo |
| ----------- | ------: | -------: |
| 2 GB        | 2048 MB |  4096 MB |
| 4 GB        | 4096 MB |  8192 MB |
| 8 GB        | 8192 MB | 16384 MB |

utilizando:

```text
C:\pagefile.sys
```

Esta configuración está orientada principalmente a equipos escolares con recursos limitados.

---

## Validación

El script se encuentra en **etapa de pruebas y validación**.

Como parte de su utilización, fue implementado y probado en **aproximadamente 90 netbooks escolares**, obteniendo un funcionamiento correcto durante las implementaciones realizadas.

Las pruebas permitieron validar principalmente:

* Generación de nombres de equipo.
* Aplicación de la nomenclatura correspondiente.
* Selección de diferentes tipos de instituciones.
* Selección de distritos.
* Identificación del tipo de equipamiento.
* Cambio del nombre del equipo en Windows.
* Configuración del archivo de paginación.
* Reinicio y aplicación de los cambios.

La cantidad indicada es **aproximada**, debido a que corresponde a equipos utilizados durante diferentes implementaciones.

Los resultados corresponden a los equipos y condiciones utilizados durante estas pruebas.

**No se garantiza el mismo comportamiento en todos los modelos de equipos, versiones de Windows o configuraciones de hardware.**

Se recomienda realizar una prueba piloto antes de implementar el script a gran escala en una infraestructura diferente.

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

## Notas

> **Nota 1:** La nomenclatura incluida en esta versión corresponde a la utilizada para la Región Educativa 7 y puede requerir modificaciones para otras Regiones Educativas.

> **Nota 2:** Los valores de configuración y las opciones disponibles dependen de la implementación para la cual fue desarrollado el script.

> **Nota 3:** El script fue probado en aproximadamente 90 netbooks escolares, pero esta validación no implica compatibilidad universal con todos los equipos o versiones de Windows.

> **Nota 4:** Antes de realizar una implementación masiva, se recomienda efectuar una prueba piloto y verificar los resultados.

---

## Estado del proyecto

**Estado:** En pruebas y validación.

La herramienta fue utilizada en aproximadamente **90 netbooks escolares** durante distintas implementaciones.

Se podrán incorporar nuevas pruebas, distritos, instituciones, tipos de equipamiento y ajustes a medida que el proyecto se utilice en diferentes entornos.

---

## Autor

**TerminalFix**

Herramientas, scripts y documentación relacionados con administración de sistemas, software libre, infraestructura y soporte técnico.

---

## Licencia

Este proyecto se distribuye bajo la licencia **MIT**.

Ver el archivo [LICENSE](LICENSE) para consultar el texto completo de la licencia.
