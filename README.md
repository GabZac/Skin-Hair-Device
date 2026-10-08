# Skin-Hair-Device

Página web que recomienda productos de cosmética y cuidado personal según las características y necesidades del usuario.

## Descripción

Este proyecto fue desarrollado para facilitar el cuidado del rostro, el cuerpo y el cabello.

Mediante un cuestionario, el usuario puede indicar sus características y obtener recomendaciones personalizadas. Los productos se cargan automáticamente desde una base de datos y cuentan con enlaces para consultar información oficial y buscar dónde conseguirlos.

El sitio no vende productos. Las recomendaciones tienen una finalidad informativa y no reemplazan una consulta profesional.

## Características

* Registro de usuarios e inicio de sesión.
* Catálogo de 206 productos cargados desde la base de datos.
* Visualización del catálogo completo sin necesidad de iniciar sesión.
* Cuestionario y filtro de recomendaciones para usuarios con sesión iniciada.
* Productos organizados por zonas del rostro, cuerpo y tratamientos capilares.
* Enlaces a fichas oficiales y búsquedas en Mercado Libre.
* Avisos emergentes con 42 consejos de cuidado personal, cada 10 minutos mientras se navega.
* Opción para cerrar o pausar los consejos.
* Menú lateral desplegable.
* Diseño con una paleta de colores y tipografías propias.

## Tecnologías utilizadas

* HTML
* CSS
* JavaScript
* PHP
* MySQL / MariaDB
* PDO para la conexión con la base de datos
* XAMPP como entorno de desarrollo local
* phpMyAdmin para administrar la base de datos

## Estructura del proyecto

La carpeta principal de la aplicación contiene:

```text
Web/
├── BD/
│   └── base_completa.sql
├── CSS/
├── FONT/
├── HTML/
│   ├── cabello/
│   ├── cuerpo/
│   ├── rostro/
│   ├── cuenta.php
│   ├── formulario.html
│   ├── formulario.php
│   ├── inicio.php
│   └── salir.php
├── IMG/
├── JS/
│   ├── menu.js
│   ├── script.js
│   └── tips.js
├── PHP/
│   ├── bootstrap.php
│   ├── catalogo.php
│   ├── tarjeta.php
│   └── zonas.php
├── .htaccess
├── index.html
└── LEEME.md
```

## Instalación local

1. Instalar XAMPP con PHP 8.1 o posterior.
2. Colocar la aplicación en `C:\xampp\htdocs\Web`.
3. Iniciar Apache y MySQL desde XAMPP.
4. Para una instalación nueva, abrir phpMyAdmin e importar `BD/base_completa.sql`.
5. El archivo SQL crea la base de datos llamada `skin-hair device`.
6. Revisar la conexión en `PHP/bootstrap.php`. La configuración local utiliza el usuario `root` y una contraseña vacía.
7. Abrir `http://localhost/Web/index.html` en el navegador.

Si la base actual ya está instalada y funciona, no es necesario volver a importar el archivo SQL. No debe importarse sobre tablas existentes.

## Funcionamiento

Los visitantes pueden recorrer todos los productos activos del catálogo.

Después de registrarse e iniciar sesión, pueden completar el cuestionario y activar el filtro de recomendaciones. El sistema compara las respuestas del último cuestionario con las etiquetas de los productos.

La cantidad de resultados depende de las respuestas y de los productos disponibles. También es posible quitar el filtro para volver a ver el catálogo completo.

Los enlaces externos permiten consultar información y buscar productos; no garantizan disponibilidad ni un vendedor determinado.

## Equipo

| Nombre | Rol |
| --- | --- |
| Sofia Mojica | Desarrollo, diseño y base de datos |
| Gabriel Zacarias | Diseño, desarrollo, base de datos y documentación |

## Objetivos del proyecto

* Facilitar y promover el cuidado personal.
* Aprender sobre desarrollo web y bases de datos.
* Aplicar consultas SQL para cargar y filtrar información.
* Conocer más sobre cosmética y cuidado facial, corporal y capilar.

## Próximas mejoras

* Incorporar más productos y marcas.
* Ampliar las preguntas del cuestionario.
* Mejorar la precisión de las recomendaciones.
* Revisar periódicamente los enlaces y la información de los productos.

## Finalidad educativa

Este proyecto fue desarrollado con fines **educativos**.

## Contacto

**Proyecto:** Skin-Hair-Device  
**GitHub:** https://github.com/GabZac/Skin-Hair-Device
