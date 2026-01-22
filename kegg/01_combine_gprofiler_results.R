# Load necessary libraries
library(dplyr)

# Define file paths and corresponding Time and Change values
file_info <- list(
  list(file = "/Users/kosukekataoka/Downloads/12h_down.csv", time = "12h", change = "down"),
  list(file = "/Users/kosukekataoka/Downloads/24h_down.csv", time = "24h", change = "down"),
  list(file = "/Users/kosukekataoka/Downloads/24h_up.csv", time = "24h", change = "up"),
  list(file = "/Users/kosukekataoka/Downloads/40h_up.csv", time = "40h", change = "up"),
  list(file = "/Users/kosukekataoka/Downloads/40h_down.csv", time = "40h", change = "down"),
  list(file = "/Users/kosukekataoka/Downloads/56h_down.csv", time = "56h", change = "down"),
  list(file = "/Users/kosukekataoka/Downloads/56h_up.csv", time = "56h", change = "up"),
  list(file = "/Users/kosukekataoka/Downloads/72h_down.csv", time = "72h", change = "down"),
  list(file = "/Users/kosukekataoka/Downloads/72h_up.csv", time = "72h", change = "up")
)

# Function to read and add Time and Change columns
read_and_add_columns <- function(file_info) {
  data <- read.csv(file_info$file)
  data <- mutate(data, Time = file_info$time, Change = file_info$change)
  return(data)
}

# Read all files and add Time and Change columns
data_list <- lapply(file_info, read_and_add_columns)

# Combine all data frames
combined_data <- bind_rows(data_list)

combined_data$gene_ratio <- (combined_data$intersection_size / combined_data$term_size) * 100

# Save the combined data to a CSV file
write.csv(combined_data, "/Users/kosukekataoka/Downloads/gprpfiler_combined.csv", row.names = FALSE)

# Display the first few rows of the combined data
# head(combined_data)
