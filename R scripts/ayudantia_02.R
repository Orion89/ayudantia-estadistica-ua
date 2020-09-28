# Para comenzar a entender “lo que dicen los datos” es necesario usar
# técnicas exploratorias que describan de una manera rápida su comportamiento,
# el análisis exploratorio de datos (tablas, resúmentes, gráficos)

# Cargamos los datos desde un archivo csv
datos_encuesta = read.csv("./datos/encuesta_ua.csv", header=TRUE, encoding = 'UTF-8', sep=',')
# ?read.csv

# # # # # # # Un primer vistazo a los datos # # # # # # #

View(datos_encuesta) # vistazo de los datos

str(datos_encuesta) # Información del data frame

summary(datos_encuesta$sexo) # Frecuencia por categoría

table(datos_encuesta$sede) # Frecuencia por categoría


# histograma simple de la edad, distribución
hist(datos_encuesta$edad, 
     col='blue',
     main='Histograma de la edad') 


# # # # # # # uso de attach # # # # # # #

attach(datos_encuesta)
table(sexo)

plot(sede) # gráfico de barras de alumnos por sede

prop.table(table(sexo)) # proporción de alumnos por sexo, primero se hace el table
prop.table(table(sexo, sede), 1) # proporción por filas
prop.table(table(sexo, sede), 2) # proporción por sede

summary(edad) # descripción/resumen númerico de la edad
max(edad) # edad máxima
mean(edad) # media de la edad

# # # # # # # Tablas de frecuencias # # # # # # #

# install.packages('fdth')
# library(fdth)

# frecuencias_edad = fdt(datos_encuesta$edad)
# frecuencias_edad

# frecuencias_edad = fdt(datos_encuesta$edad, k=5)
# frecuencias_edad


# # # # # # # Polígono de frecuencias # # # # # # #

install.packages('agricolae')
library(agricolae)

h = graph.freq(datos_encuesta$edad)
summary(h)

plot(h, col='blue', frequency=1)
polygon.freq(h, col='red', frequency=1, lwd=2)
