# Loading DataSet
library(readr)
data <-read_csv("Womens Clothing E-Commerce Reviews.csv")
# Spearman's Rho test for correlation between two variables
result <- cor.test(data$Rating, data$Age, method = "spearman")
# Print the test results
print(result)





