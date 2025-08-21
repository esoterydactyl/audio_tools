#!/bin/bash

# Script by: @esoterydactyl
# Ver: 1.1.1
# 8/18/2025
# This is a handy script for normalizing, trimming, and correctly formatting samples for drums.

check_sox() {
    if ! command -v sox &> /dev/null
    then
        echo "Error: SoX is not installed. Please install it to run this script."
        echo "On Ubuntu/Debian, use: sudo apt-get install sox libsox-fmt-mp3"
        echo "On macOS, use: brew install sox"
        exit 1
    fi
}

main() {
    check_sox

    output_dir="normalized"

    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"
        echo "Created output directory: $output_dir"
    else
        echo "Using existing output directory: $output_dir"
    fi

    echo "Starting audio processing..."

    for file in *; do
        if [ -f "$file" ]; then
            # Had to use case instead of normal globbing because ableton likes to create files with ".wav.asd" extensions. 🤦🏼‍♂️
            case "$file" in
                *.wav|*.mp3|*.flac|*.aiff)
                    filename=$(basename -- "$file")
                    filename_no_ext="${filename%.*}"

                    sanitized_name=$(echo "$filename_no_ext" | tr '[:upper:]' '[:lower:]' | tr -d ' ' | tr '_' '-' | tr -d '.')
                    echo ""
                    echo "--------------------------"
                    echo "⏳ Processing '$file'..."

                    output_path="$output_dir/${sanitized_name}_norm.wav"
                    # https://explainshell.com/explain?cmd=sox+%22%24file%22+-r+44100+-b+16+-c+2+%22%24output_path%22+silence+1+0.05+0.05%25+reverse+silence+1+0.05+0.05%25+reverse+gain+-n+-3
                    sox "$file" -r 44100 -b 16 -c 2 "$output_path" silence 1 0.05 0.01% reverse silence 1 0.05 0.01% reverse gain -n -3

                    # Check if the sox command was successful and the output file is not empty
                    if [ $? -eq 0 ] && [[ -s "$output_path" ]]; then
                        echo "✅ Successfully processed '$file'. Output saved to '$output_path'."
                    else
                        echo "⛔️ Error processing '$file'. The file may have failed to process or the output file is empty."
                    fi
                    ;;
                *)
            esac
        fi
    done
    echo ""
    echo "🌈 Audio processing complete. Have a nice day!"
}

main
