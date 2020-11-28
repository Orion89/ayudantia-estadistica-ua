# Para comenzar a entender “lo que dicen los datos” es necesario usar
# técnicas exploratorias que describan de una manera rápida su comportamiento,
# el análisis exploratorio de datos (tablas, resúmentes, gráficos)

# Estaremos trabajando con un conjunto de datos en el cual se registran el monto de las propinas 
# recibidas por los meseros según diversas características de los clientes y el momento 
# de consumo


# Importación de una tabla de datos en formato csv (comma separated values)
# Guardamos el objeto en la variable 'propinas'
propinas = read.csv("datos/propinas.csv", sep=",", header = TRUE, dec = ".")

# # # # # # # # Un primer vistazo a los datos # # # # # # # #

# Con la función head() podemos hechar un vistazo a las primera 6 filas del data frame
head(propinas)

# Si queremos ver todos los datos, usamos la función View()
View(propinas)

# Para obtener información sobre las variables (columnas) del data frame
str(propinas)

# __________________________ Exploración por variable __________________________ #

# # # # # # # # Variable sexo # # # # # # # #

# Con la función table(), obtenemos las frecuencias absolutas para cada categoría
table(propinas$sexo) # Si estos fueran los datos de un año ¿Qué concluirías?

# con la función summary() también obtenemos las frecuencias absolutas
summary(propinas$sexo)

# Si deseamos trazar un gráfico para las frecuencias anteriores usamos la función plot()
# Como se trata de una variable categórica (factores), R "ploteará" un gráfico de barras
plot(propinas$sexo, col="blue")
plot(propinas$sexo, col="blue", border='red', main='Frecuencia por sexo', ylab='Frecuencia')

# Proporciones: con la función prop.table(), podemos obtener las proporciones (frencias
# relativas) por categoría
prop.table(table(propinas$sexo))

# # # # # # # # Variable propina # # # # # # # #

# Como propina es una variable cuantitativa, la función table() devolverá todos los valores
# de la variable
table(propinas$propina)

# ¿Cuál es el promedio de las propinas?
mean(propinas$propina)

# ¿Y su mediana?
median(propinas$propina)

# ¿Cuál es la máxima propina registrada?
max(propinas$propina)

# La función summary() nos entrega el valor mínimo, el primer cuartil, la mediana (2do cuartil),
# la media, el tercer cuartil (75%), y el valor máximo de los datos
summary(propinas$propina)

# Parecido es el resultado de la función fivenum(): nos devuelve el valor mínimo, primer cuartil
# (25%), mediana (50%), tercer cuartil (75%) y el valor máximo del vector
fivenum(propinas$propina)

# Varianza muestral de las propinas
var(propinas$propina)

sd(propinas$propina)

# Histograma de las propinas, ¿qué podemos deducir? ¿Cuáles son más frecuentes?
hist(propinas$propina, main = "Distribución de las propinas")

# Histograma del total de las boletas, ¿qué podemos deducir?
hist(propinas$total_boleta, main = "Distribución del total de las boletas")

# Boxplot para el total boleta ¿En qué valor están más "cocentradas"?
boxplot(propinas$propina, main="Boxplot de las propinas")

# __________________________ Exploración bivariada __________________________ #

# Boxplot para el total boleta
boxplot(propinas$total_boleta)

# Boxplot para las propinas por día de la semana. ¿Qué día es mejor para los meseros?
boxplot(propinas$propina~propinas$dia)

# ¿Qué día de la semana los clientes gastan más?
boxplot(propinas$total_boleta~propinas$dia, xlab = "Día de la semana", ylab="Total boleta")

# ¿Y cómo son las propias por sexo? ¿Quién da más propina? ¿Qué sexo es el más variable en la
# propona que da?
boxplot(propinas$propina~propinas$sexo)

# Para evitar escribir a cada momento la sintaxis nombre_data_frame$nombre_columna
# usaremos la función attach(), la cual hará accesibles las columnas del df como variables
attach(propinas)

# Gráfico de dispiersión (scatter plot)
plot(total_boleta, propina, type="p")
# Podemos agregar texto dentro del gráfico para, por ejemplo, señalar puntos importantes
text(44, 10, "valor atípico")

# ¿Qué frecuencias hay de fumadores?
plot(fumador)

boxplot(propina~fumador)

# Trazaremos un scatter plot del total boleta versus la cantidad de propida
# para todos los niveles del factor sexo
coplot(propina~total_boleta|sexo)

# ¿Qué ocurre con el día domingo?
coplot(propina~total_boleta|dia, columns=4) # Agregamos 4 columnas

# Si deseamos pedir ayuda, debemos ingresar el signo de cierre de interrogación y el
# nombre de la función sin los paréntesis
?coplot

# Un gráfico de dispersión con una dimesión adicional, haciendo uso del paquete paletteer
install.packages("paletteer") # Instalamos el paquete
install.packages("scico") # un paquete requerido 

library(paletteer) # Lo cargamos en memoria

colores <- paletteer_c("scico::berlin", n = 4)

# Ploteamos
plot(
  x = total_boleta, 
  y = propina,
  bg = colores[ unclass(sexo)],
  cex = 2,
  pch=21)
