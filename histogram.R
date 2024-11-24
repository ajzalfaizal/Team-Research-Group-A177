# Load necessary library
library(readr)

# Load the dataset
d <- read.csv("C:/Users/user/OneDrive/Desktop/Womens Clothing E-Commerce Reviews.csv")

# Assuming 'Rating' is a numeric variable
y <- d$Rating

# Creating  histogram
h <- hist(y,
          breaks = 5,  # Number of bins
          main = "Womens Clothing E-Commerce Rating",
          xlab = "Rating",
          ylab = "Frequency",  # Changed to a more appropriate label
          col = "azure",
          xlim = c(0, 5)  # Set x-axis limits according to your data
)

# Calculate mean and standard deviation
mn <- mean(y, na.rm = TRUE)  # Calculate mean, handling NA values
stdDev <- sd(y, na.rm = TRUE)  # Calculate standard deviation, handling NA values

# Create a sequence of x values for the normal distribution (more points for a smoother curve)
x <- seq(0, 5, length.out = 100)  # 100 points for a smooth curve

# Calculate the normal distribution values
yn <- dnorm(x, mean = mn, sd = stdDev)

# Scale the normal distribution to match the histogram
box.size <- diff(h$mids[1:2]) * length(y)  # Width of the histogram bar times the number of observations
yn <- yn * box.size  # Scale the normal curve

# Add the normal distribution line to the histogram
lines(x, yn, col = "red", lwd = 2)  # lwd controls the line width
