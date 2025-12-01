#Since input file is in mtx format converting it into a format supported by Cellbender

import scanpy as sc
import pandas as pd

folder_path = '/Users/manjulagurunathan/Downloads/E-MTAB-7895-quantification-raw-files/'


adata = sc.read_mtx(f"{folder_path}/matrix.mtx").T
genes = pd.read_csv(f"{folder_path}/features.csv", header=None)
barcodes = pd.read_csv(f"{folder_path}/barcodes.csv", header=None)

adata.var_names = genes[0]
adata.obs_names = barcodes[0]

print(f"adata shape: {adata.shape}")
print(f"First 5 genes: {list(adata.var_names)[:5]}")
print(f"First 5 barcodes: {list(adata.obs_names)[:5]}")

adata.write("/Users/manjulagurunathan/Downloads/E-MTAB-7895-quantification-raw-files/E-MTAB-7895_combined.h5ad")
