#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 input.mkv start_time end_time output.gif"
    echo "Example: $0 input.mkv 00:01:23 00:01:45 output.gif"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Error: Incorrect number of arguments"
    usage
fi

# Assign arguments to variables
input_file=$1
start_time=$2
end_time=$3
output_file=$4

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found"
    exit 1
fi

# Run ffmpeg command to create GIF
# ffmpeg -i "$input_file" -vf "fps=10,scale=400:240:-1:flags=lanczos" -ss "$start_time" -to "$end_time" -y "$output_file"
ffmpeg -i "$input_file" -vf "fps=15" -ss "$start_time" -to "$end_time" -y "$output_file"

# Check if ffmpeg command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create GIF"
    exit 1
fi

echo "GIF created successfully: $output_file"

