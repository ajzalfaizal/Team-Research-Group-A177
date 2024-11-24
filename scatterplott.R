library(readr)

data <- read.csv("C:/Users/user/OneDrive/Desktop/Womens Clothing E-Commerce Reviews.csv")

df<-data

x <- df$Age
y <- df$Rating


# Plot with main and axis titles
# Change point shape (pch = 19) and include frames.
plot(x   # independent variable (Age)
   , y # dependent variable (Rating)
  , main = "Scatterplot of Rating vs Age" # chart title
  , xlab = "Age" # x-axis label
  , ylab = "Rating" # y-axis label
  , pch = 1 # point shape (unfilled circle)
  , frame = T # surround chart with a frame
       )
model <- lm(y ~ x, data = df) # compute the linear model
abline(model, col = "black") # draw the model as a blue line






