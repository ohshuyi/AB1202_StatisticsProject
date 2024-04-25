# Load the dplyr package
library(dplyr)
par(mar = c(5, 13, 4, 2))  # Increase the left margin to see plot

# Read the existing CSV file
retinol_data <- read.csv("sephora_filtered_retinol.csv")
niacinamide_data <- read.csv("sephora_filtered_niacinamide.csv")
peptide_data <- read.csv("sephora_filtered_peptide.csv")
hydroxypinacolone_retinoate_data <- read.csv("sephora_filtered_hydroxypinacolone_retinoate.csv")

boxplot(retinol_data$rating, niacinamide_data$rating, peptide_data$rating, hydroxypinacolone_retinoate_data$rating,
        main = "Multiple boxplots for rating comparision",
        at = c(1,3,5,7),
        names = c("Retinol", "Niacinamide", "Peptide", "Hydroxypinacolone Retinoate"),
        las = 2,
        col = c("orange","red", "blue", "green"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#stats analysis - rating
boxplot.stats(retinol_data$rating)
boxplot.stats(niacinamide_data$rating)
boxplot.stats(peptide_data$rating)
boxplot.stats(hydroxypinacolone_retinoate_data$rating)


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
        main = "Multiple boxplots for price per mL comparision",
        at = c(1,3,5,7),
        names = c("Retinol", "Niacinamide", "Peptide", "Hydroxypinacolone Retinoate"),
        las = 2,
        col = c("orange","red", "blue", "green"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#stats analysis - price per ml
boxplot.stats(retinol_data$price_per_ml)
boxplot.stats(niacinamide_data$price_per_ml)
boxplot.stats(peptide_data$price_per_ml)
boxplot.stats(hydroxypinacolone_retinoate_data$price_per_ml)

#IQR Calculation - rating
boxplot(retinol_data$rating)$stats[4] - boxplot(retinol_data$rating)$stats[2] 
boxplot(niacinamide_data$rating)$stats[4] - boxplot(niacinamide_data$rating)$stats[2] 
boxplot(peptide_data$rating)$stats[4] - boxplot(peptide_data$rating)$stats[2] 
boxplot(hydroxypinacolone_retinoate_data$rating)$stats[4] - boxplot(hydroxypinacolone_retinoate_data$rating)$stats[2] 

#IQR Calculation - price per ml
boxplot(retinol_data$price_per_ml)$stats[4] - boxplot(retinol_data$price_per_ml)$stats[2] 
boxplot(niacinamide_data$price_per_ml)$stats[4] - boxplot(niacinamide_data$price_per_ml)$stats[2] 
boxplot(peptide_data$price_per_ml)$stats[4] - boxplot(peptide_data$price_per_ml)$stats[2] 
boxplot(hydroxypinacolone_retinoate_data$price_per_ml)$stats[4] - boxplot(hydroxypinacolone_retinoate_data$price_per_ml)$stats[2] 

#upper lower whisker range - rating
boxplot(retinol_data$rating)$stats[5] - boxplot(retinol_data$rating)$stats[1] 
boxplot(niacinamide_data$rating)$stats[5] - boxplot(niacinamide_data$rating)$stats[1] 
boxplot(peptide_data$rating)$stats[5] - boxplot(peptide_data$rating)$stats[1] 
boxplot(hydroxypinacolone_retinoate_data$rating)$stats[5] - boxplot(hydroxypinacolone_retinoate_data$rating)$stats[1] 

#upper lower whisker range - price per ml
boxplot(retinol_data$price_per_ml)$stats[5] - boxplot(retinol_data$price_per_ml)$stats[1] 
boxplot(niacinamide_data$price_per_ml)$stats[5] - boxplot(niacinamide_data$price_per_ml)$stats[1] 
boxplot(peptide_data$price_per_ml)$stats[5] - boxplot(peptide_data$price_per_ml)$stats[1] 
boxplot(hydroxypinacolone_retinoate_data$price_per_ml)$stats[5] - boxplot(hydroxypinacolone_retinoate_data$price_per_ml)$stats[1] 

#reset back plot size
par(mar = c(5, 4, 4, 2))