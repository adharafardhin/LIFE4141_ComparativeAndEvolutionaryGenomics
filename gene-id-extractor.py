# Define the input TSV file and column name
tsv_file = "1-2-1_hits_all_gene_descriptions.tsv"  # Replace with your input TSV file name
column_name = "CochleariaID"  # Replace with the desired column name

# Read the TSV file into a DataFrame
df = pd.read_csv(tsv_file, sep='\t')

# Extract values from the specified column
values = df[column_name]

# Define the output TXT file name
txt_file = "gene-ids.txt"  # Replace with your desired output TXT file name

# Write the values to the TXT file
with open(txt_file, 'w') as txt:
    for value in values:
        txt.write(f"{value}\n")

print(f"Values from '{column_name}' column written to '{txt_file}'.")
