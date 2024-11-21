install.packages("ggplot2")  # Run this line if ggplot2 is not installed
library(ggplot2)

data <- read.csv("C:/Users/user/OneDrive/Desktop/Womens Clothing E-Commerce Reviews.csv")

# Create age groups
data$AgeGroup <- cut(data$Age, breaks = seq(0, 100, by = 10), right = FALSE)

# Calculate average rating by age group
avg_rating_by_age <- aggregate(Rating ~ AgeGroup, data = data, FUN = mean)

# Create a bar plot of average ratings by age group
ggplot(avg_rating_by_age, aes(x = AgeGroup, y = Rating)) +
  geom_bar(stat = "identity", fill = "lightblue") +  # Use stat = "identity" for pre-computed values
  labs(title = "Average Rating by Age Group",
       x = "Age Group",
       y = "Average Rating") +
  theme_minimal()


# Ensure Age and Rating are numeric
data$Age <- as.numeric(data$Age)
data$Rating <- as.numeric(data$Rating)

# Remove any rows with NA values in Age or Rating
data <- na.omit(data[, c("Age", "Rating")])

# Calculate Pearson's correlation and p-value
correlation_test <- cor.test(data$Age, data$Rating)

# Extract Pearson's r and p-value
pearson_r <- correlation_test$estimate  # Pearson's correlation coefficient
p_value <- correlation_test$p.value      # p-value


# Print the results
cat("Pearson's r:", pearson_r, "\n")
cat("p-value:", p_value, "\n")

