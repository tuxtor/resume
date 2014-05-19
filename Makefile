PAN=pandoc
WKHTML=wkhtmltopdf
RESUME=resume
INDEX=index
STYLE=style.css
SOURCE=resume
LINGUAS="" -es -pt_BR


all:	html pdf

git-%:	html pdf
	git add -A
	git commit -m "$(@:git-%=%)"
	git push origin master

html:
	$(foreach lingua,$(LINGUAS),$(PAN) --standalone --from markdown --to html -c $(STYLE) -o $(INDEX)$(lingua).html $(SOURCE)$(lingua).md;)
	# $(SOURCE)-$(lingua).md

pdf:
	$(foreach lingua,$(LINGUAS), $(WKHTML) -L 20mm -R 20mm $(INDEX)$(lingua).html $(RESUME)$(lingua).pdf; )

view:	html
	xdg-open $(INDEX).html

clean:
	rm -rf *.pdf *.html
