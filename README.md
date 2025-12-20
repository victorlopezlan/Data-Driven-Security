__MÁSTER CYBERSECURITY MANAGEMENT__
__PRÁCTICA 1 - ASIGNATURA DATA DRIVEN SECURITY__

__AUTOR: MIRIAM, ORIOL, VÍCTOR__

Este repositorio contiene un proyecto desarrollado en R mediante RStudio para el análisis de datos a partir de un conjunto de datos en formato CSV (epa_http.csv). 
El análisis puede ejecutarse de dos formas: mediante un script .R o generando un informe en HTML a partir de un archivo .Rmd.



__Estructura del proyecto__

  ├── epa-http.csv
  
  ├── codiR.R
  
  ├── Practica1.Rmd
  
  ├── Practica1.html
  
  └── README.md






__Descripción de los archivos__

__epa-http.csv__

  Archivo CSV que contiene el conjunto de datos utilizado en la práctica.
  
  Es la fuente de información y es leído tanto por el script .R como por el documento .Rmd.

__codiR.R__

  Script de R que contiene todo el código necesario para ejecutar el análisis solicitado en la práctica de forma directa desde la consola o RStudio.
  
  Permite: cargar el dataset, limpiar y procesar los datos, generar resultados y gráficos.
  
  Se puede ejecutar seleccionando todo el código del archivo y Control + Shift + Intro.


__Practica1.Rmd__

  Documento R Markdown que combina código, texto y resultados para generar el informe de la práctica.
  
  Al renderizarse, genera un informe en HTML con el análisis completo y sus conclusiones.
  
  Para generar el HTML: Control + Shift + K


__Practica1.html__

  Informe final generado a partir del archivo Pratica1.Rmd.
  
  Puede abrirse directamente en cualquier navegador web y se sobreescribe cada vez que se renderiza Practica1.Rmd.





__Requisitos__

  R 
  
  RStudio
  
  Paquetes utilizados: readr, stringr





__Uso del proyecto__

Clonar el repositorio: https://github.com/victorlopezlan/Data-Driven-Security.git

Abrir el proyecto en RStudio y ejecutar:

  codiR.R , seleccionar todo el código y Control + Shift + Intro
  
  Practica1.Rmd para generar el informe en HTML, Control + Shift + K





__Notas__

El dataset debe mantenerse en formato CSV y en la ruta indicada.
