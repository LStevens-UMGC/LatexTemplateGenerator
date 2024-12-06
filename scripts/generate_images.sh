#!/bin/bash

# Define the path to the screenshots directory
DIR="./screenshots" # Called from makefiles directory
# Output LaTeX file where the image inclusion commands will be appended
LATEX_FILE="./include_images.tex"

# Create or clear the output LaTeX file
echo "% Automatically generated LaTeX file" > $LATEX_FILE

# Variable to store the last processed subfolder
last_subfolder=""

# Find all PNG files in the directory and its subdirectories
find "$DIR" -type f -name "*.png" | while read img; do
  # Extract the relative path from the screenshots directory
  rel_path="${img#$DIR/}"
  # Extract the folder name (subdirectory) from the relative path
  subfolder=$(dirname "$rel_path")
  
  # If the current subfolder is different from the last processed one, add a subsection
  if [[ "$subfolder" != "." && "$subfolder" != "$last_subfolder" ]]; then
    echo "\\subsection{$subfolder}" >> $LATEX_FILE
    echo >> $LATEX_FILE
    last_subfolder="$subfolder"  # Update the last processed subfolder
  fi

  # Extract the filename without the path
  filename=$(basename "$img")
  
  # Append LaTeX command to include the image
  echo "\\begin{figure}[H]" >> $LATEX_FILE
  echo "  \\centering" >> $LATEX_FILE
  echo "  \\includegraphics[width=0.8\\textwidth]{$img}" >> $LATEX_FILE 
  echo "  \\caption{$filename}" >> $LATEX_FILE
  echo "  \\label{fig:$filename}" >> $LATEX_FILE
  echo "\\end{figure}" >> $LATEX_FILE
  echo >> $LATEX_FILE
done
