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

# Calculate proportions for visualization
proportions <- prop.table(contingency_table, margin = 1)
proportions_df <- as.data.frame(as.table(proportions))
colnames(proportions_df) <- c("AgeGroup", "RatingGroup", "Proportion")

# Plot proportions using ggplot2
ggplot(proportions_df, aes(x = AgeGroup, y = Proportion, fill = RatingGroup)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(
    title = "Proportions of Ratings by Age Group",
    x = "Age Group",
    y = "Proportion"
  ) +
  scale_fill_manual(values = c("Low Rated" = "cyan", "Highly Rated" = "blue")) +
  theme_minimal()