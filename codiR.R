#--------------------------------
# title: Práctica 1
# author: Oriol, Víctor, Miriam
# date: 2025-12-15
#--------------------------------

# Carga de librerías
library(readr)
library(dplyr)
library(stringr)
# Carga de datos
epa_http <- read_table("epa-http.csv", col_names = FALSE, show_col_types = F)
colnames(epa_http) <- c("IP", "Timestamp", "Tipo", "URL", "Protocolo", "ResponseCode", "Bytes")
# Cambiamos el tipo de la columna ResponseCode a factor 
epa_http$ResponseCode <- as.factor(epa_http$ResponseCode)
# Cambiamos el tipo de la columna Bytes a integer
epa_http$Bytes <- as.integer(epa_http$Bytes)
#Limpiamos el simbolo " al inicio del campo Tipo con libreria stringr
epa_http$Tipo <- str_remove(epa_http$Tipo, '^"')
#Alternativa para limpiar " del inicio del campo Tipo
#epa_http$Tipo <- sub('^"', '', epa_http$Tipo)
#Limpiamos el simbolo " del final del campo Protocolo con libreria stringr
epa_http$Protocolo <- str_remove(epa_http$Protocolo, '"$')
# Visualización datos
head(epa_http)

################           Ejercicio 1               ########################
# Número filas
nrow(epa_http)
# Número columnas
ncol(epa_http)
# Valor medio de la columna Bytes
mean(epa_http$Bytes, na.rm = T)

################           Ejercicio 2               ########################

# Número IPs .edu
sum(grepl(".edu", epa_http$IP))

################           Ejercicio 3               ########################

# Creamos un nuevo dataframe donde solo estan las filas con GET
epa_get <- epa_http[epa_http$Tipo == "GET", ]

#Cogemos en nuevo dataframe y le creamos una nueva columna llamada hora con el valor correspondiente del Timestamp
epa_get <- epa_get %>%
  mutate(
    Hora = sub("^\\[|\\]$", "", Timestamp),  # quita [ ]
    Hora = sapply(strsplit(Hora, ":"), `[`, 2)
  )

#Hacemos el conteo de cuantas veces aparece cada una de las horas:
# Para ello creamos un dataframe nuevo con solo dos columnas, el valor de las horas [0-23] y el número de veces que aparece cada hora
conteo_horas <- epa_get %>%count(Hora)

#Mostramos solo la primera fila, ya que estamos filtrando de manera descendente la columna que contiene el número de veces que aparece cada hora
hora_max <- conteo_horas %>%
  arrange(desc(n)) %>%  # Orden descendente
  slice(1) %>%                  # Solo la primera fila
  pull(Hora)                     # Extrae la columna "Hora"

#Hora mayor volumen de peticiones
hora_max

################           Ejercicio 4                ########################

#filtramos solo las filas que contienen la cadena de texto ".edu" en la columna de IP
epa_edu <- epa_http[grepl("\\.edu", epa_http$IP), ]

#filtramos solo las filas que contienen un fichero de descarga .txt
epa_edu <- epa_edu[grepl("\\.txt", epa_edu$URL), ]

#Hacemos la suma de la columna de Bytes, ignorando aquellos que tienen valor de NA
sum(epa_edu$Bytes, na.rm = T)

################           Ejercicio 5                ########################

#Hacemos la suma de las filas cuyo URL tenga de valor "/"
sum(epa_http$URL == "/")

################           Ejercicio 6                ########################

#Hacemos la suma de las filas cuyo Protocolo NO tenga de valor HTTP/0.2 
cat(sum(epa_http$Protocolo != "HTTP/0.2"))