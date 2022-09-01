.PHONY: clean run show view v

LATEXMK=latexmk -lualatex -latexoption=-shell-escape
TARGET=paper-military-september-2022
TLK=talk-mda-2020-11

run: $(TARGET).pdf

tlk: $(TLK).pdf

$(TARGET).pdf $(TLK).pdf: %.pdf: %.tex
	$(LATEXMK) $<
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

show: $(TLK).pdf
	evince $< &

view: show

v: run
	evince $(TARGET).pdf

touch:
	touch $(TARGET).tex
