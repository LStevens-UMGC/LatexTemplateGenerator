#!/bin/bash

# Check if a filepath argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

# Define the output LaTeX file
output_file="sourceCode.tex"

echo "\\section{Source Code}" > "$output_file"

# Recursive function to process directories
process_directory() {
  local current_dir="$1"
  
  # Add a section for the current directory
#   echo "\\section*{$(basename "$current_dir")}" >> "$output_file"
  
  # Loop through files and directories
  for entry in "$current_dir"/*; do
    if [ -d "$entry" ]; then
      # Recursively process subdirectories
      echo "\\subsection*{$entry}" >> "$output_file"
      process_directory "$entry"
    elif [ -f "$entry" ]; then
      # Get file extension and base name
      extension="${entry##*.}"
      file_name=$(basename "$entry")
      
      # Add a subsection for the file
      echo "\\subsubsection*{$file_name}" >> "$output_file"
      
      # Add the lstlisting block with style
      echo "\\begin{lstlisting}[style=$extension]" >> "$output_file"
      cat "$entry" >> "$output_file"
      echo "\\end{lstlisting}" >> "$output_file"
    fi
  done
}

# Start processing the provided directory
process_directory "$1"

# Inform the user
echo "LaTeX document generated: $output_file"
