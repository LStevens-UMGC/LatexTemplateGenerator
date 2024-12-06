#!/bin/bash

# Check if a filepath argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

# Possible files to create
approach="./tex/approach.tex"
assumptions="./tex/assumptions.tex"
design="./tex/design.tex"
lessons="./tex/lessons.tex"
main="./tex/main.tex"
notImplemented="./tex/notimplemented.tex"
packages="./tex/packages.tex"
possibleImprovements="./tex/possibleImprovements.tex"
refereneces="./tex/references.bib"
requirements="./tex/requirements.tex"
runInstructions="./tex/runInstructions.tex"
screenshots="./tex/screenshots.tex"
sourceCode="./tex/sourceCode.tex"
systemReqs="./tex/systemReqs.tex"
testCases="./tex/testCases.tex"
umlDiagram="./tex/umlDiagram.tex"
userGuide="./tex/userGuide.tex"

# Runs create function of input class
initialize(){
    local class=$1

    if [[ "$class" == 315 ]]; then
        create315
    elif [[ "$class" == 330 ]]; then
        create330
    elif [[ "$class" == 335  ]]; then
        create335
    elif [[ "$class" == 412 ]]; then
        create412 
    elif [[ "$class" == 425 ]]; then
        create425 
    elif [[ "$class" == 430 ]]; then
        create430
    elif [[ "$class" == 451 ]]; then
        create451
    fi
}

# CMSC 315 file structure
create315(){
    mainStart
    requirementes
    umlDiagram
    approach
    testCases
    lessons
    mainEnd
}

# CMSC 330 file structure
create330(){
    mainStart
    systemReqs
    runInstructions
    requirementes
    approach
    testCases
    screenshots
    lessons
    mainEnd
}

# CMSC 335 file structure
create335(){
    mainStart
    approach
    assumptions
    notImplemented
    userGuide
    lessons
    possibleImprovements
    umlDiagram
    sourceCode
    testCases
    screenshots
    mainEnd
}

create412(){
    mainStart
    screenshots
    sourceCode
    mainEnd
}

# CMSC 425 file structure
create425(){
    mainStart
    design
    screenshots
    lessons
    sourceCode
    mainEnd
}

# CMSC 430 file structure
create430(){
    mainStart
    requirements
    approach
    testCases
    screenshots
    lessons
    mainEnd
}

# CMSC 451 file structure
create451(){
    mainStart
    mainEnd
}

# Setup main.tex opening portion
mainStart(){
    echo "\\documentclass{article}" > "$main"
    echo "" >> "$main"
    echo "\\input{$packages}" >> "$main"
    echo "" >> "$main"
    echo "\\title{}" >> "$main"
    echo "\\author{Name \\\\" >> "$main"
    echo "CMSC \\\\" >> "$main"
    echo "Professor \\\\" >> "$main"
    echo "m d, y}" >> "$main"
    echo "\\date{}" >> "$main"
    echo "" >> "$main"
    echo "\\begin{document}" >> "$main"
    echo "" >> "$main"
    echo "\\vspace{5\baselineskip}" >> "$main"
    echo "\\maketitle" >> "$main"
    echo "\\newpage" >> "$main"
    echo "" >> "$main"
    echo "\\tableofcontents" >> "$main"
    echo "\\newpage" >> "$main"
    echo "" >> "$main"
}

# Setup main.tex ending portion
mainEnd(){
    echo "" >> "$main"
    echo "\\end{document}" >> "$main"
}

# Packages.tex
packages(){
    echo ""
}

# Create approach.tex and include in main
approach(){
    echo "\\include{$approach}" >> "$main"
    echo "\\section{Approach}" > "$approach"
}

# Create assumptions.tex and include in main
assumptions(){
    echo "\\include{$assumptions}" >> "$main"
    echo "\\section{Assumptions}" > "$assumptions"
}

# Create design.tex and include in main
design(){
    echo "\\include{$design}" >> "$main"
    echo "\\section{Program Design/Functionlaity}" > "$design"
}

# Create lessons.tex and include in main
lessons(){
    echo "\\include{$lessons}" >> "$main"
    echo "\\section{Lessons Learned}" > "$lessons"
}

# Create notImplimented.tex and include in main
notImplemented(){
    echo "\\include{$notImplemented}" >> "$main"
    echo "\\section{Not Implemented}" > "$notImplemented"
}

# Create screenshots.tex and include in main
possibleImprovements(){
    echo "\\include{$possibleImprovements}" >> "$main"
    echo "\\section{Possible Improvements}" > "$possibleImprovements"
}

# Create requirementes.tex and include in main
requirements(){
    echo "\\include{$requirements}" >> "$main"
    echo "\\section{Requirements}" > "$requirements"
}

# Create requirementes.tex and include in main
runInstructions(){
    echo "\\include{$runInstructions}" >> "$main"
    echo "\\section{Run Instructions}" > "$runInstructions"
}

# Create screenshots.tex and include in main
screenshots(){
    echo "\\include{$screenshots}" >> "$main"
    echo "\\section{Screenshots}" > "$screenshots"
}

# Create sourceCode.tex and include in main
sourceCode(){
    echo "\\include{$sourceCode}" >> "$main"
    echo "\\section{Source Code}" > "$sourceCode"
}

# Create systemReqs.tex and include in main
systemReqs(){
    echo "\\include{$systemReqs}" >> "$main"
    echo "\\section{System Requirements}" > "$systemReqs"
}

# Create testCases.tex and include in main
testCases(){
    echo "\\include{$testCases}" >> "$main"

    echo "\\section{Test Cases}" > "$testCases"
    echo "" >> "$testCases"
    echo "\\begin{table}[h!]" >> "$testCases"
    echo "  \\centering" >> "$testCases"
    echo "  \\caption{Test Results Table}" >> "$testCases"
    echo "  \\begin{tabular}{|c|c|c|c|c|}" >> "$testCases"
    echo "      \\hline" >> "$testCases"
    echo "      Test \# & Input & Expected Output & Actual Output & Result \\\\" >> "$testCases"
    echo "      \\hline" >> "$testCases"
    echo "      1 & Example Input & Expected 1 & Actual 1 & Pass \\\\" >> "$testCases"
    echo "      \\hline" >> "$testCases"
    echo "  \\end{tabular}" >> "$testCases"
    echo "\\end{table}" >> "$testCases"
}

# Create umlDiagram.tex and include in main
umlDiagram(){
    echo "\\include{$umlDiagram}" >> "$main"
    echo "\\section{UML Diagram}" > "$umlDiagram"
}

# Create userGuide.tex and include in main
userGuide(){
    echo "\\include{$userGuide}" >> "$main"
    echo "\\section{User Guide}" > "$userGuide"
}

# Create reference.bib and include in main
references(){
    echo "nocite{*}" >> "$main"
    echo "\\bibliographystyle{apalike}" >> "$main"
    echo "\\bibliography{$references}" >> "$main"
    echo "" > "$references"
}


initialize "$1"