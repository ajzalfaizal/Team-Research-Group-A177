attach(data1)
data1
data1[1:3]
x <-data1$Age
y <-data1$Rating

plot(x
     ,y
     ,main ="scatterplot"
     ,xlab ="age"
     ,ylab = "rating"
     ,pch = 19
     ,frame = T
     )
model <- lm(y - x, data = data1)
abline(model, col = "blue")