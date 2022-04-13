### Machine Learning
library(MASS)
data(Boston)
data <- Boston

idx_train <- sample(nrow(data), nrow(data) * 0.75)
data_train <- data[idx_train, ]
data_test <- data[-idx_train, ]

library(caret)
# training the model
tr <- trainControl(
    method = "repeatedcv",
    number = 5
)
modelo_knn <- train(medv ~ .,
    data = data_train, method = "knn",
    trControl = tr,
    preProcess = c("center", "scale"),
    tuneGrid = expand.grid(k = 5)
)
# make predictions using test data
predicciones <- predict(modelo_knn, data_test)

cor(data_test$medv, predicciones)^2

plot(data_test$medv, predicciones)

## choosing k
tr <- trainControl(
    method = "repeatedcv",
    number = 5
)
modelo_knn <- train(medv ~ .,
    data = data_train, method = "knn",
    trControl = tr,
    preProcess = c("center", "scale"),
    tuneGrid = expand.grid(k = 1:10)
)

plot(modelo_knn)

predicciones <- predict(modelo_knn, data_test)

cor(data_test$medv, predicciones)

plot(data_test$medv, predicciones)