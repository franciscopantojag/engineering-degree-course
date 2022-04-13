dato <- 97
print(dato)
## guardar dato tipo caracter
nombre <- "Piura"

usedcars <- read.csv("data/usedcars.csv", sep = ";")

# extraer la columna 3
usedcars[, 3]

# extraer la fila 3
usedcars[3, ]

# extraer la columna precio
usedcars$price

# guardar un objeto precio
precios <- usedcars$price

# transformar una variable
precios2 <- precios * 3.8

# operaciones
logprecio <- log(precios)

# resumenes estadisticos
mean(precios)
sd(precios)
min(precios)
max(precios)

summary(precios)

# extraer precios de los autos más nuevos
years <- usedcars$year
summary(years)

precios[years > 2010]

# extraer columnas, c es para concatenar
usedcars[c("year", "price")]

usedcars[c("year" > 2010, "model" == "SEL")]

# filtrar y luego extraer
id <- which(usedcars$year > 2010 & usedcars$model == "SEL")

# resumen estadisticos de cada variable
usedcars[id, ]
summary(usedcars)

usedcars$model <- factor(usedcars$model)
usedcars$color <- factor(usedcars$color)
usedcars$transmission <- factor(usedcars$transmission)


##################### -----Visualizaciones

# Histograma

hist(usedcars$price)

# ggplot2 para graficas profesionales

hist(usedcars$price,
     las = 1, col = "blue",
     main = "Histograma de precios de autos",
     xlab = "Precio", ylab = "Frecuencia"
)


##########################################################
## 09.04.2022
# caja bigote
boxplot(usedcars$price ~ usedcars$model)
boxplot(usedcars$price ~ usedcars$transmission)
boxplot(usedcars$price ~ usedcars$model * usedcars$transmission)

boxplot(usedcars$price ~ usedcars$transmission * usedcars$model)
boxplot(usedcars$price ~ usedcars$year)

# grafico de dispersion
plot(usedcars$mileage, usedcars$price)

plot(usedcars$year, usedcars$price)

plot(usedcars$mileage, usedcars$price, pch = 19, col = usedcars$model)
plot(usedcars$mileage, usedcars$price, pch = 19, col = usedcars$transmission)

# matriz de dispersion
pairs(usedcars[, c(1, 3, 4)])
pairs(usedcars[c("year", "price", "mileage")])

cor(usedcars$mileage, usedcars$price)
cor(usedcars[, c(1, 3, 4)])