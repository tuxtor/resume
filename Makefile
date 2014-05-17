PAN=pandoc
WKHTML=wkhtmltopdf
INDEX=index.html
PDF=resume.pdf
STYLE=style.css
SOURCE=RESUME.md

all:	html pdf


html:
	$(PAN) --standalone --from markdown --to html -c style.css -o $(INDEX) $(SOURCE)

pdf:
	$(WKHTML) --print-media-type $(INDEX) $(PDF)

view:	html
	xdg-open $(INDEX)&

clean:
	rm -rf *.pdf *.html
