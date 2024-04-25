library(dplyr)
sephora_data <- read.csv("product_info.csv")

#ensure that the rating fields are all filled
sephora_data <- sephora_data %>%
  filter(!is.na(sephora_data$rating))

nrow(data.frame(sephora_data$rating))
sd(sephora_data$rating)

# Set the random seed for reproducibility
set.seed(50)

# Generate a non-normally distributed population
population <- sephora_data$rating

# Create a histogram of the population
par(mfrow = c(1, 2)) # Set up a 1x2 grid for plotting

# Plot the histogram of the population
hist(population, breaks = 30, prob = TRUE, main = "Population Distribution",
     xlab = "Value", col = "lightblue")


# Set the random seed for reproducibility
set.seed(50)

# Step 2 and 3: Draw random samples and calculate sample means
sample_size <- 4264
num_samples <- 40000

# Empty vector to store sample means
sample_means <- c()

for (i in 1:num_samples) {
  # Take a random sample
  sample <- sample(population, size = sample_size, replace = TRUE)
  
  # Calculate the mean of the sample
  sample_means[i] <- mean(sample)
}

# For sample
x_bar <- mean(sample_means)
std <- sd(sample_means)

print('Sample Mean and Variance')
print(x_bar)
print(std**2)

# For Population
mu <- mean(population)
sigma <- sd(population)

print('Population Mean and Variance')
print(mu)
print((sigma**2)/sample_size)

# Plot the histogram of sample means
hist(sample_means, breaks = 30, prob = TRUE, main = "Distribution of Sample Means",
     xlab = "Sample Mean", col = "lightgreen")

# Overlay density curves
curve(dnorm(x, mean = x_bar, sd = std), col = "black", lwd = 2, add = TRUE)

# Add labels and legends
#legend("topright", legend = c("Distribution Curve"),
       #col = c("black"), lwd = 1)

# Reset the plot layout
par(mfrow = c(1, 1))
quantile(sample_means)

library(BSDA)

retinol_data = read.csv("sephora_filtered_retinol.csv")

sample_data_retinol = retinol_data$rating

mean(sample_data_retinol)

# Define the hypothesized population mean
population_mean = 4.199836

# Define the population standard deviation (replace with your actual value)
population_sd = std

# Perform one-sample z-test
z_test_result_retinol <- BSDA::z.test(x = sample_data_retinol, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_retinol)



#z-test for vitamin c
vitaminC_data = read.csv("sephora_filtered_vitaminC.csv")

sample_data_vitaminC = vitaminC_data$rating

mean(sample_data_vitaminC)

# Perform one-sample z-test
z_test_result_vitaminC <- BSDA::z.test(x = sample_data_vitaminC, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_vitaminC)



#z-test for niacinamide
niacinamide_data = read.csv("sephora_filtered_niacinamide.csv")

sample_data_niacinamide = niacinamide_data$rating

mean(sample_data_niacinamide)

# Perform one-sample z-test
z_test_result_niacinamide <- BSDA::z.test(x = sample_data_niacinamide, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_niacinamide)


#z-test for peptides
peptide_data = read.csv("sephora_filtered_peptide.csv")

sample_data_peptide = peptide_data$rating

mean(sample_data_peptide)

# Perform one-sample z-test
z_test_result_peptide <- BSDA::z.test(x = sample_data_peptide, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_peptide)


#z-test for hyaluronic acid
hyaluronic_acid_data = read.csv("sephora_filtered_hyaluronic_acid.csv")

sample_data_hyaluronic_acid = hyaluronic_acid_data$rating

mean(sample_data_hyaluronic_acid)

# Perform one-sample z-test
z_test_result_hyaluronic_acid <- BSDA::z.test(x = sample_data_hyaluronic_acid, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_hyaluronic_acid)



#z-test for hydroxypinacolone retinoate
hydroxypinacolone_retinoate_data = read.csv("sephora_filtered_hydroxypinacolone_retinoate.csv")

sample_data_hydroxypinacolone_retinoate = hydroxypinacolone_retinoate_data$rating

mean(sample_data_hydroxypinacolone_retinoate)

# Perform one-sample z-test
z_test_result_hydroxypinacolone_retinoate <- BSDA::z.test(x = sample_data_hydroxypinacolone_retinoate, mu = population_mean, sigma.x = population_sd, alternative = "less")

# Print the result
print(z_test_result_hydroxypinacolone_retinoate)