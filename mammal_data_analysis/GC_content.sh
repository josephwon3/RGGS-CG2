sequence=""
while IFS= read -r line
do
    if [[ $line == ">"* ]]; then
        if [[ -n $sequence ]]; then
            gc_count=$(echo "$sequence" | grep -o "[GCgc]" | wc -l)  # count Gs and Cs
            total_count=${#sequence}  # get total number of bases
            gc_percentage=$(echo "scale=2; ($gc_count/$total_count)*100" | bc)
            echo "GC Content: $gc_percentage%" >> gc_output.txt
            sequence=""  # Reset sequence for the next one
        fi
        echo "$line" >> gc_output.txt  # Print the header to output.txt
    else
        sequence+="$line"  # append sequence lines
    fi
done < m2778_subsampled_gb.fas
