PAN=pandoc
all:
	$(PAN) -H header.tex RESUME.md -o resume.pdf

view:
	$(PAN) -H header.tex RESUME.md -o resume.pdf&&evince resume.pdf

clean:
	rm -rf *.pdf
