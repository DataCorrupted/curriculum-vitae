ifeq ($(OS),Windows_NT)
	PDFVIEWER=chrome
else
	PDFVIEWER=xdg-open
endif

all: cv resume_chn resume_eng clean

cv: cv.tex
	latex $<
	dvipdfm cv.dvi

resume_eng: resume_eng.tex
	latex $<
	dvipdfm resume_eng.dvi

resume_chn: resume_chn.tex
	latex $<
	dvipdfm resume_chn.dvi

clean:
	rm *.log *.aux *.dvi *.out
	$(PDFVIEWER) *.pdf &
