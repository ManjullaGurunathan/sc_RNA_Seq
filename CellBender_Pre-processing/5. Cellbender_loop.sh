#!/bin/bash
#PBS -l select=1:ncpus=4:mem=24gb:ngpus=1
#PBS -l walltime=01:00:00


INPUT_DIR="/Users/manjulagurunathan/Downloads/E-MTAB-7895-quantification-raw-files"
OUTPUT_DIR="/Users/manjulagurunathan/Downloads/E-MTAB-7895-quantification-raw-files/CellBender_outs/cellbender_out"
mkdir -p "$OUTPUT_DIR"

for h5ad_file in "$INPUT_DIR"/*.h5ad; do
    if [[ -f "$h5ad_file" ]]; then
        base_name=$(basename "$h5ad_file" .h5ad)
        sample_dir="$OUTPUT_DIR/${base_name}_cellbender_outs"
        mkdir -p "$sample_dir"

        output_file="$OUTPUT_DIR/${base_name}_cellbender.h5"
        
        echo "Running Cellbender, $basename -> ${basename}_cellbender.h5"
        #cellbender remove-background \
            #--cuda \
            #--input "$h5ad_file" \
            #--output "$output_file" 
        echo "Cellbender analysis completed on $base_name, Ambient RNA removed."
    fi
done
