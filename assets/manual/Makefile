#               *Translator Definitions*
CC = latex

OPTIONS = 

#               *Macros        *
genericDep = $(shell echo `grep "begin{document" *.tex|cut -d":" -f1`) 
GENERIC_DEP := $(patsubst %.tex,%.dvi,$(genericDep))
DOC_DEP := $(patsubst %.dvi,%,$(GENERIC_DEP))
INDEXFILE := $(HOME)/www/jfibu/index.html
#               *Implicit Rules*

%.dvi:%.tex  

	$(CC) $(OPTIONS) $< 
#
#               *Explicit Rules*

all: $(GENERIC_DEP) 

$(DOC_DEP): $(GENERIC_DEP)
	latex2html -split 0 $(patsubst %.dvi,%,$?)
install: $(DOC_DEP)
	-cp -a $(DOC_DEP) $(HOME)/www/jfibu/
	#rm -rf  $(DOC_DEP)
	cat dochead > $(INDEXFILE)
	for i in $(DOC_DEP); do  echo "<LI><A HREF=\"/~$(USER)/jfibu/$$i\">$$i</A>" >>$(INDEXFILE); done
	echo "<LI><A HREF=\"/~$(USER)/jfibu/todo.html\">TODO</A>" >>$(INDEXFILE); 
	cat doctail >> $(INDEXFILE)

.PHONY : clean
clean : 
	-rm -f *.dvi *.log *.aux *.lot *.lof *.toc *~  *.swp core


