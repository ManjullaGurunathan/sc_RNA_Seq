#Convert CellBender output to Seurat-compatible format

pip install tables

ptrepack --complevel 5 E-MTAB-7895_cellbender_output_file_3_filtered.h5:/matrix E-MTAB-7895_cellbender_output_filtered_seurat.h5:/matrix
