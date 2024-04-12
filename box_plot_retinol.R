# Load the dplyr package
library(dplyr)

# Read the existing CSV file
retinol_data <- read.csv("sephora_filtered_retinol.csv")
niacinamide_data <- read.csv("sephora_filtered_niacinamide.csv")
peptide_data <- read.csv("sephora_filtered_peptide.csv")
hydroxypinacolone_retinoate_data <- read.csv("sephora_filtered_hydroxypinacolone_retinoate.csv")

boxplot(retinol_data$rating, niacinamide_data$rating, peptide_data$rating, hydroxypinacolone_retinoate_data$rating,
        main = "Multiple boxplots for  rating comparision",
        at = c(1,3,5,7),
        names = c("Retinol", "Niacinamide", "Peptide", "Hydroxypinacolone Retinoate"),
        las = 2,
        col = c("orange","red", "blue", "green"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

boxplot.stats(retinol_data$rating)
boxplot.stats(niacinamide_data$rating)
boxplot.stats(peptide_data$rating)
boxplot.stats(hydroxypinacolone_retinoate_data$rating)




install.packages("stringr")
library(stringr)

retinol_data <- retinol_data %>%
  mutate(
    ml = as.numeric(str_extract(size, "\\d+(?=\\s*mL)")),  # Extracts numbers followed by " mL"
    price_per_ml = ifelse(!is.na(ml), price_usd / ml, NA)  # Divides the price by mL if mL is not NA
  )

niacinamide_data <- niacinamide_data %>%
  mutate(
    ml = as.numeric(str_extract(size, "\\d+(?=\\s*mL)")),  # Extracts numbers followed by " mL"
    price_per_ml = ifelse(!is.na(ml), price_usd / ml, NA)  # Divides the price by mL if mL is not NA
  )

peptide_data <- peptide_data %>%
  mutate(
    ml = as.numeric(str_extract(size, "\\d+(?=\\s*mL)")),  # Extracts numbers followed by " mL"
    price_per_ml = ifelse(!is.na(ml), price_usd / ml, NA)  # Divides the price by mL if mL is not NA
  )

hydroxypinacolone_retinoate_data <- hydroxypinacolone_retinoate_data %>%
  mutate(
    ml = as.numeric(str_extract(size, "\\d+(?=\\s*mL)")),  # Extracts numbers followed by " mL"
    price_per_ml = ifelse(!is.na(ml), price_usd / ml, NA)  # Divides the price by mL if mL is not NA
  )

boxplot(retinol_data$price_per_ml, niacinamide_data$price_per_ml, peptide_data$price_per_ml, hydroxypinacolone_retinoate_data$price_per_ml,
        main = "Multiple boxplots for pricr per mL comparision",
        at = c(1,3,5,7),
        names = c("Retinol", "Niacinamide", "Peptide", "Hydroxypinacolone Retinoate"),
        las = 2,
        col = c("orange","red", "blue", "green"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

 
