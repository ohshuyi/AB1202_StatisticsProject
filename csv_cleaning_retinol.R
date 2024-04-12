# Load the dplyr package
library(dplyr)

# Read the existing CSV file
sephora_data <- read.csv("product_info.csv")

# Count number of rows that have products with retinol & have a rating
retinol_num <- sum(grepl("retinol", sephora_data$ingredients, ignore.case = TRUE) 
                   & !is.na(sephora_data$rating))

# check for number of products with retinol (for checking of csv later)
print(retinol_num)


# select the relevant columns required
sephora_data <- sephora_data %>%
  select(rating, ingredients, product_id, product_name, brand_id, brand_name)

# filter out rows with products only containing retinol & contain ratings
sephora_data <- sephora_data %>%
  filter(!is.na(rating)&
          grepl("retinol", ingredients, ignore.case = TRUE))

# write new csv with cleaned data
write.csv(sephora_data, "sephora_filtered_retinol.csv", row.names = FALSE)