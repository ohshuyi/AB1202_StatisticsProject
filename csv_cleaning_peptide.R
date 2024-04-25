# Load the dplyr package
library(dplyr)

# Read the existing CSV file
sephora_data <- read.csv("product_info.csv")

# Count number of rows that have products with Peptide & have a rating
peptide_num <- sum(grepl("Peptide", sephora_data$ingredients, ignore.case = TRUE) 
                   & !is.na(sephora_data$rating))

# check for number of products with Peptide (for checking of csv later)
print(peptide_num)


# select the relevant columns required
sephora_data <- sephora_data %>%
  select(rating, ingredients, product_id, product_name, brand_id, brand_name, price_usd, size)

# filter out rows with products only containing Peptide & contain ratings
sephora_data <- sephora_data %>%
  filter(!is.na(rating)&
           grepl("Peptide", ingredients, ignore.case = TRUE))

# write new csv with cleaned data
write.csv(sephora_data, "sephora_filtered_peptide.csv", row.names = FALSE)