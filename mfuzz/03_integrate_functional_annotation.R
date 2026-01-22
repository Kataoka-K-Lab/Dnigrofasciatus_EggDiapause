import pandas as pd

annotation_path = '/Users/kosukekataoka/Desktop/Functional_annotation.all.csv'

df_ann = pd.read_csv(annotation_path)

selected_columns = ['Genes', 'Dmel', 'Dmel_gene', 'Dmel_function', 'nr', 'uni_sprot', 'Description', 'Preferred_name', 'PFAMs']
filtered_df_ann = df_ann[selected_columns]

## Short

work_dir = '/Users/kosukekataoka/Desktop/'

deg_path = '/Users/kosukekataoka/Desktop/clusters_short.csv'

df_deg = pd.read_csv(deg_path)
df_deg = df_deg.rename(columns={'Unnamed: 0': 'gene_id'})
df_deg = df_deg.rename(columns={'x': 'cluster'})

merged_df = pd.merge(df_deg, filtered_df_ann, left_on='gene_id', right_on='Genes', how='inner')
merged_df = merged_df.drop(columns=['Genes'])

merged_df.to_csv(work_dir + 'merged_annotation_short.csv', index=False)

## Long

work_dir = '/Users/kosukekataoka/Desktop/'

deg_path = '/Users/kosukekataoka/Desktop/clusters_long.csv'

df_deg = pd.read_csv(deg_path)
df_deg = df_deg.rename(columns={'Unnamed: 0': 'gene_id'})
df_deg = df_deg.rename(columns={'x': 'cluster'})

merged_df = pd.merge(df_deg, filtered_df_ann, left_on='gene_id', right_on='Genes', how='inner')
merged_df = merged_df.drop(columns=['Genes'])

merged_df.to_csv(work_dir + 'merged_annotation_long.csv', index=False)
