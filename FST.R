### LIFE4141 Population Genomics Assignment
## Part 2. Selection Scan for outlier regions of the genome

### This code conducts an exploratory analysis of weighted Fst values across the genome. 


# Loading necessary libraries
library(ggplot2)
library(dplyr)

# Setting working directory
setwd("C:/Users/adhar/OneDrive/Documents/LEVI_Coursework/Extracted") # Set this to your own working directory.

# Reading the Fst file
fst_data <- read.table("LAB_NENT_fst.windowed.weir.fst", header = TRUE)

#Creating a scatterplot of Fst values
ggplot(fst_data, aes(x = BIN_START, y = WEIGHTED_FST)) +
  geom_point() +
  ggtitle("Weighted Fst Values Across Genome") +
  xlab("Bin Start (bp)") +
  ylab("Weighted Fst Value")

# Sorting the Fst values in descending order
sorted_fst <- fst_data %>% arrange(desc(WEIGHTED_FST))

# Calculating the top 1% threshold
top_1_percent_threshold <- quantile(sorted_fst$WEIGHTED_FST, probs = 0.99)

# Selecting candidate regions with Fst values above the threshold
candidate_regions <- sorted_fst %>% filter(WEIGHTED_FST > top_1_percent_threshold)

# Viewing the selected candidate regions
print(candidate_regions)

# Saving the candidate regions to a CSV file
write.csv(candidate_regions, file = "candidate_regions.csv", row.names = FALSE)

# Visualizing Fst values with candidate selective sweep regions highlighted
ggplot(fst_data, aes(x = BIN_START, y = WEIGHTED_FST)) +
  geom_point() +
  ggtitle("Weighted Fst Values Across Genome") +
  xlab("Bin Start (bp)") +
  ylab("Weighted Fst Value") +
  geom_point(data = candidate_regions, aes(x = BIN_START, y = WEIGHTED_FST), color = "red", size = 3) +
  geom_hline(yintercept = top_1_percent_threshold, linetype = "dashed", color = "green") +
  annotate("text", x = max(fst_data$BIN_START), y = top_1_percent_threshold, label = "Top 1%", vjust = -0.5, hjust = 1, color = "blue")

