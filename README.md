MÁSTER CYBERSECURITY MANAGEMENT
PRÁCTICA 1 - ASIGNATURA DATA DRIVEN SECURITY

AUTOR: MIRIAM, ORIOL, VÍCTOR

Este repositorio contiene un proyecto desarrollado en R mediante RStudio para el análisis de datos a partir de un conjunto de datos en formato CSV (epa_http.csv). 
El análisis puede ejecutarse de dos formas: mediante un script .R o generando un informe en HTML a partir de un archivo .Rmd.

Estructura del proyecto

├── epa-http.csv
├── codiR.R
├── Practica1.Rmd
├── Practica1.html
└── README.md

Descripción de los archivos

epa-http.csv
Archivo CSV que contiene el conjunto de datos utilizado en la práctica.
Es la fuente de información y es leído tanto por el script .R como por el documento .Rmd.

codiR.R
Script de R que contiene todo el código necesario para ejecutar el análisis solicitado en la práctica de forma directa desde la consola o RStudio.
Permite: cargar el dataset, limpiar y procesar los datos, generar resultados y gráficos.
Se puede ejecutar seleccionando todo el código del archivo y Control + Shift + Intro.

Practica1.Rmd
Documento R Markdown que combina código, texto y resultados para generar el informe de la práctica.
Al renderizarse, genera un informe en HTML con el análisis completo y sus conclusiones.
Para generar el HTML: Control + Shift + K

Practica1.html
Informe final generado a partir del archivo report.Rmd.
Puede abrirse directamente en cualquier navegador web y se sobreescribe cada vez que se renderiza Practica1.Rmd.

Requisitos
R 
RStudio
Paquetes utilizados: readr, stringr


Uso del proyecto
Clonar el repositorio: https://github.com/victorlopezlan/Data-Driven-Security.git
Abrir el proyecto en RStudio y ejecutar:
  analysis.R , seleccionar todo el código y Control + Shift + Intro
  report.Rmd para generar el informe en HTML, Control + Shift + K

Notas
El dataset debe mantenerse en formato CSV y en la ruta indicada.
