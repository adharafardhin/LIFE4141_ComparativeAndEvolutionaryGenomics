### LIFE4141 Population Genomics Assignment
## Part 3. Candidate gene identification

### This code performs a step-by-step analysis of Arabidopsis thaliana homologs to identify and explore metal-related genes.

# Setting working directory
setwd("C:/Users/adhar/OneDrive/Documents/LEVI_Coursework/Extracted") # Set this to your own working directory.

## STEP 1: Reading the Arabidopsis thaliana homolog table into a data frame
homolog_table <- read.table("1-2-1_hits_all_gene_descriptions.tsv", header = TRUE, sep = "\t")

## STEP 2: Displaying information about the homolog table

# Display the first few rows of the table
head(homolog_table)

# View column names
colnames(homolog_table)

#Summary of the table
summary(homolog_table)

## STEP 3: Matching candidate genes

# Specifying the path to the text file containing candidate genes
genes_file_path <- "candidate_genes.txt"

# Reading the list of candidate genes from the file
candidate_genes <- readLines(genes_file_path)

# Now, the 'candidate_genes' is a character vector containing all the candidate gene names

# Matching candidate genes with their Arabidopsis thaliana homologs
matching_genes <- homolog_table$CochleariaID[match(candidate_genes, homolog_table$CochleariaID)]

## STEP 4: Identifying the metal-related genes

# Filtering genes with metal-related descriptions
metal_related_genes <- matching_genes[grep("metal transport|metal binding|metal metabolism", homolog_table$Athaliana_description, ignore.case = TRUE)]

## STEP 5: Exploring Metal-Related Genes

# Displaying the list of metal-related genes
print(metal_related_genes)

## STEP 6: Creating a data frame for Metal-Related Genes

# Assuming 'metal_related_genes' is a character vector
metal_genes_table <- data.frame(Gene = metal_related_genes)

# Printing the table using kable
knitr::kable(metal_genes_table, caption = "Metal-Related Genes")

## STEP 7: Filtering out 'NA' entries from metal_related_genes

# Filtering out 'NA' entries from metal_related_genes
filtered_metal_genes <- metal_related_genes[!is.na(metal_related_genes)]

# Creating a data frame excluding 'NA' entries
filtered_metal_genes_table <- data.frame(Gene = filtered_metal_genes)

# Printing the filtered table using kable
knitr::kable(filtered_metal_genes_table, caption = "Filtered Metal-Related Genes (Excluding NA)")

