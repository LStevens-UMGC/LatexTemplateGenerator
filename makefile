SRC_DIR = ../src
COURSE = ""
TEX_FILES =  main.tex approach.tex assumptions.tex design.tex\
	lessons.tex notimplemented.tex references.bib requirements.tex runInstructions.tex\
	possibleImprovements.tex screenshots.tex sourceCode.tex testCases.tex umlDiagram.tex\
	userGuide.tex
MAIN_TEX = ./tex/main.tex
# rtf markdown man
# all: pdf xml docx html epub

# minimize_pdf: pdf
# 	@bash ./scripts/minimize_pdf.sh ./dist/main.pdf ./dist/main.min.pdf

pdf:
	pdflatex $(MAIN_TEX) -aux-directory=./temp -output-directory=./dist
	bibtex ./temp/main
	pdflatex $(MAIN_TEX) -aux-directory=./temp -output-directory=./dist
	pdflatex $(MAIN_TEX) -aux-directory=./temp -output-directory=./dist

# xml:
# 	pandoc main.tex -o ./dist/main.xml

docx:
	pandoc $(MAIN_TEX) -o ./dist/main.docx

html:
	pandoc $(MAIN_TEX) -o ./dist/main.html

epub:
	pandoc $(MAIN_TEX) -o ./dist/main.epub

screenshots:
	@bash ./scripts/generate_images.sh

source:
	@bash ./scripts/generate_source.sh $(SRC_DIR)

init:
	@bash ./scripts/generate_initial.sh $(COURSE)

clearTexFiles:
	@rm $(addprefix ./tex/, $(TEX_FILES))

clean:
	@rm -f ./dist/*
	@rm -f ./temp/tex/*.aux    
	@rm -f ./temp/tex/*.log
	@rm -f ./temp/tex/*.bbl
	@rm -f ./temp/tex/*.blg

.PHONY: all screenshots source clean pdf xml docx html epub clearTexFiles init minimize_pdf