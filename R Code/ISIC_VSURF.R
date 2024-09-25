# Load necessary libraries
library(pacman)
pacman::p_load(VSURF, parallel, foreach, doParallel, randomForest, dplyr)

# Load your dataset
my_data <- read.csv("train-metadata.csv")

# Remove the columns that should not be used for prediction
columns_to_remove <- c("isic_id", "iddx_full", "iddx_1", "iddx_2", "iddx_3", "iddx_4", 
                       "iddx_5", "lesion_id", "mel_mitotic_index", "mel_thick_mm", 
                       "tbp_lv_dnn_lesion_confidence")
my_data <- my_data[, -which(names(my_data) %in% columns_to_remove)]

# Convert categorical variables to factors
my_data$sex <- as.factor(my_data$sex)
my_data$anatom_site_general <- as.factor(my_data$anatom_site_general)
my_data$image_type <- as.factor(my_data$image_type)
my_data$tbp_tile_type <- as.factor(my_data$tbp_tile_type)
my_data$tbp_lv_location <- as.factor(my_data$tbp_lv_location)
my_data$tbp_lv_location_simple <- as.factor(my_data$tbp_lv_location_simple)

# Replace NA values with 0
my_data[is.na(my_data)] <- 0

# Ensure the target variable is a factor
my_data$target <- as.factor(my_data$target)

# Stratified Sampling: Ensure positive cases are fully included and sample negatives
set.seed(123)  # For reproducibility

# Separate positive and negative cases
positive_cases <- my_data %>% filter(target == 1)
negative_cases <- my_data %>% filter(target == 0)

# Sample a portion of the negative cases (e.g., 10x the number of positive cases)
negative_sample <- negative_cases %>% sample_n(size = 3000)  # Adjust size as needed

# Combine the positive cases with the sampled negative cases
balanced_data <- bind_rows(positive_cases, negative_sample)

# Check the balance of the new dataset
table(balanced_data$target)

# Prepare the data for VSURF
X <- balanced_data[, -which(names(balanced_data) == "target")]
y <- balanced_data$target

# Detect the number of available cores for parallel processing
num_cores <- detectCores() - 1  # Leave one core free for the system

# Set up a parallel backend
cl <- makeCluster(num_cores)
registerDoParallel(cl)

# Run VSURF with parallel processing
vsurf_model <- VSURF(X, y, parallel = TRUE, ncores = num_cores)

# Summarize and select features
summary(vsurf_model)
selected_features <- vsurf_model$varselect.interp
print(selected_features)

# Stop the parallel cluster
stopCluster(cl)

# Train a random forest model using the selected features
X_selected <- X[, selected_features, drop = FALSE]
rf_model <- randomForest(X_selected, y, importance = TRUE)

# Get the importance scores from the random forest model
importance_scores <- importance(rf_model)

# Convert the importance scores to a data frame
importance_df <- data.frame(
  Feature = colnames(X_selected),
  Importance = importance_scores[, "MeanDecreaseAccuracy"]
)

# Sort the data frame by importance (descending order)
importance_df <- importance_df[order(-importance_df$Importance), ]

# Display the top 5 features with their importance scores
top_5_features <- head(importance_df, 5)
print(top_5_features)

