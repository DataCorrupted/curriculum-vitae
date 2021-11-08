PREFIX=$(shell pwd)
ifeq ($(OS),Windows_NT)
	PDFVIEWER=chrome
else
	PDFVIEWER=xdg-open
endif

all: resume_eng clean

resume_eng: resume_eng.tex
	xelatex $<
	$(PDFVIEWER) $(PREFIX)/resume_eng.pdf &

clean:
	rm *.log *.aux *.dvi *.out -rf
