# Curriculum-vitae

My personal curriculum vitae. Using latex.

You may find this template [here](http://www.latextemplates.com/template/medium-length-professional-cv)

## src

Includes a long version of CV and bilingual resume. All latex source file.

## script

Contains two utility I wrote to compile latex.

	./script/compile-latex.sh <file-name-without-suffix>

will compile _<file-name-without-suffix>.tex_ and put result in _../cv-pdf/<file-name-without-suffix>.pdf_

	./script/update.sh

will update the git and compile all of the files.
