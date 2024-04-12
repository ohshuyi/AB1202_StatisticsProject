# Load the dplyr package
library(dplyr)

# Read the existing CSV file
sephora_data <- read.csv("product_info.csv")

# Count number of rows that have products with ViatminC & have a rating
vitaminC_num <- sum(grepl("Vitamin C", sephora_data$ingredients, ignore.case = TRUE) 
                   & !is.na(sephora_data$rating))

# check for number of products with ViatminC (for checking of csv later)
print(vitaminC_num)


# select the relevant columns required
sephora_data <- sephora_data %>%
  select(rating, ingredients, product_id, product_name, brand_id, brand_name)

# filter out rows with products only containing ViatminC & contain ratings
sephora_data <- sephora_data %>%
  filter(!is.na(rating)&
           grepl("Vitamin C", ingredients, ignore.case = TRUE))

# write new csv with cleaned data
write.csv(sephora_data, "sephora_filtered_vitaminC.csv", row.names = FALSE)