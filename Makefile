PREFIX=$(shell pwd)
ifeq ($(OS),Windows_NT)
	PDFVIEWER=chrome
else
	PDFVIEWER=xdg-open
endif

all: cv resume_chn resume_eng clean

cv: cv.tex
	xelatex $<
	$(PDFVIEWER) $(PREFIX)/cv.pdf &

resume_eng: resume_eng.tex
	xelatex $<
	$(PDFVIEWER) $(PREFIX)/resume_eng.pdf &

resume_chn: resume_chn.tex
	xelatex $<
	$(PDFVIEWER) $(PREFIX)/resume_chn.pdf &

clean:
	rm *.log *.aux *.dvi *.out -rf
