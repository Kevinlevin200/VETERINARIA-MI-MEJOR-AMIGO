# Veterinaria “Mi Mejor Amigo” - Proyecto MySQL

Este proyecto corresponde a una base de datos diseñada para gestionar la información de una veterinaria llamada **“Mi Mejor Amigo”**, que ofrece servicios médicos, de baño, estética y tratamientos para mascotas.

---

## Objetivo

Organizar y gestionar eficientemente los datos de dueños, mascotas, servicios, visitas y tratamientos mediante el uso de un modelo relacional implementado en **MySQL**.

---

## Contenido del Proyecto

| Archivo          | Descripción                                                              |
|------------------|--------------------------------------------------------------------------|
| `estructura.sql` | Contiene las sentencias `CREATE TABLE` para construir la base de datos. |
| `datos.sql`      | Contiene instrucciones `INSERT INTO` con datos de prueba para poblar las tablas. |
| `consultas.sql`  | Contiene 15 consultas `SELECT` que demuestran el uso de funciones, alias, subconsultas, etc. |
| `diagrama.png`   | Imagen del diagrama EER (modelo entidad-relación) generado en MySQL Workbench. |

---

## Estructura de la Base de Datos

El modelo está compuesto por las siguientes entidades:

- **Dueño**: Información de los dueños de las mascotas.
- **Mascota**: Registro de cada mascota.
- **Especie**: Tipo de animal (Perro, Gato, etc.).
- **Servicios**: Servicios que presta la veterinaria (baño, vacunación, etc.).
- **Visita**: Cada vez que una mascota asiste a la veterinaria.
- **Tratamiento**: Medicamentos o indicaciones médicas.
- **Registro**: Tabla intermedia entre mascota y visita.

Las relaciones están definidas por llaves foráneas y respetan las cardinalidades entre las entidades.

---

## Requisitos Técnicos

- MySQL Server 8.x o compatible
- MySQL Workbench
- Conexión local (localhost)

---

## Cómo ejecutar el proyecto

1. Abrir **MySQL Workbench**
2. Ejecutar el script `estructura.sql` para crear la base de datos y sus tablas.
3. Ejecutar el script `datos.sql` para insertar datos de prueba.
4. Abrir `consultas.sql` y ejecutar las consultas según se requiera.
5. Visualizar el diagrama desde el EER o desde el archivo `diagrama.png`.

---

## Funcionalidades demostradas en `consultas.sql`

- Alias en campos y subconsultas
- Funciones de agregación (`COUNT`, `AVG`, `MAX`, etc.)
- Funciones de texto (`UPPER`, `LOWER`, `CONCAT`, `LENGTH`, `SUBSTRING`, `TRIM`)
- Función `IF`
- Creación de tabla temporal a partir de una consulta
- `JOIN`, `GROUP BY`, `ORDER BY` y más

---
# Proceso y evidencias
-
---
# Enlace de video
-
---

## Autores

- KEVIN SANTIAGO RIVERO RUEDA 
- JUAN CAMILO ROJAS ARENAS