#--------------------------------
# title: Práctica 1
# author: Oriol, Víctor, Miriam
# date: 2025-12-15
#--------------------------------

# Carrega llibreries
library(readr)
# Carrega dades
epa_http <- read_table("epa-http.csv", col_names = FALSE, show_col_types = F)
# Visualització dades
head(epa_http)

################           Ejercicio 1               ########################
# Número de files
nrow(epa_http)
# Número de columnes
ncol(epa_http)
# Convertir columna Bytes de char a double
epa_http$X7 <- as.double(epa_http$X7)
# Calcular la mitja de la columna Bytes
mean(epa_http[[7]], na.rm = T)

################           Ejercicio 2               ########################

# Número IPs .edu
sum(grepl(".edu", epa_http$X1))

################           Ejercicio 3               ########################

# Limpiar comillas campo GET
epa_http$X3 <- sub('^"', '', epa_http$X3)
# Filtramos las filas que tienen GET
epa_get <- epa_http[epa_http$Action == "GET", ]
#Cogemos en nuevo dataframe y le creamos una nueva columna llamada hora con el valor correspondiente del Timestamp
epa_get <- epa_get %>%
  mutate(
    Hora = sub("^\\[|\\]$", "", Timestamp),  # quita [ ]
    Hora = sapply(strsplit(Hora, ":"), `[`, 2)
  )


#Creamos un nuevo dataframe con solo las horas de las peticiones GET y que cuenta cuantas veces aparece cada hora:
conteo_horas <- epa_get %>%
  count(Hora)

# Filtramos en orden descendente (mayor numero de veces que aparece la hora a menor)
# esto hace que la hora más común quede en primera fila de la tabla y solo tengamos que mostrar la primera fila para responder la pregunta del ejercico
head(conteo_horas[order(conteo_horas$n, decreasing = TRUE), ], 1)

################           Ejercicio 4                ########################

#filtramos solo las filas que contienen la cadena de texto ".edu" en la columna de IP
epa_edu <- epa_http[grepl("\\.edu", epa_http$IP), ]

#filtramos solo las filas que contienen un fichero de descarga .txt
epa_edu <- epa_edu[grepl("\\.txt", epa_edu$File), ]

#Hacemos la suma de la columna de Bytes, ignorando aquellos que tienen valor de NA
sum(epa_edu$Bytes, na.rm = T)

################           Ejercicio 5                ########################

#Hacemos la suma de las filas cuyo File tenga de valor "/"
sum(epa_http$File == "/")
