# Load required libraries
library(ggplot2)
library(dplyr)

# Load your data
data <- read.csv("C:/Users/user/OneDrive/Desktop/Womens Clothing E-Commerce Reviews.csv")

# Classify age groups
data$AgeGroup <- ifelse(data$Age <= 40, "Young", "Old")

# Classify rating groups
data$RatingGroup <- ifelse(data$Rating >= 4, "Highly Rated", "Low Rated")

# Create a contingency table
contingency_table <- table(data$AgeGroup, data$RatingGroup)

# Perform the chi-square test
chi_square_test <- chisq.test(contingency_table)

# Print results
print("Contingency Table:")
print(contingency_table)

print("Chi-Square Test Results:")
print(chi_square_test)

