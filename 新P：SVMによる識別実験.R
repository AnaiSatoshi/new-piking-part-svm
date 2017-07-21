# データのインポートとdataframeの準備
library(readr)
svm特徴量ログ2017711214519 <- read_csv("~/Documents/研究室/amed/解析データ/svm特徴量ログ2017711214519.csv")
df <- svm特徴量ログ2017711214519
df <- subset(df, select = c(T_Circularity, rect2_Width, rect2_Height, Area, Class))

#SVMの実施
library(e1071)
k <- nrow(df)
model <- svm(formula = Class ~ .,  data = df, scale = TRUE, type = "C-classification", kernel = "radial", cost = 1, gamma = 0.25, cross = k)
summ <- summary(model)

#Confusion Matrixの計算
predict <- fitted(model)
cm <- table(predict, df$Class)

#誤り箇所の可視化
acc <- summ$accuracies
acc <- data.frame(acc)
