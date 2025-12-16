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
# Número de files
nrow(epa_http)
# Número de columnes
ncol(epa_http)
# Convertir columna Bytes de char a double
epa_http$X7 <- as.double(epa_http$X7)
# Calcular la mitja de la columna Bytes
mean(epa_http[[7]], na.rm = T)
# Número IPs .edu
sum(grepl(".edu", epa_http$X1))
# Limpiar comillas campo GET
epa_http$X3 <- sub('^"', '', epa_http$X3)
