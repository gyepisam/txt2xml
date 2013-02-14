
DESTDIR = /usr/local/bin

all:
	echo "No default action. run make test or make install"

install:
	cp txt2xml  $(DESTDIR)/

.PHONY: clean realclean test doc

doc : README.md

test: test.sh
	sh test.sh

%.xml : %.pl
	perl test.pl > test.xml

%.sh : %.gsl %.xml
	gsl -q -ignorecase:0 -script:$^ > $@ 

%.md : %.txt
	gitdown $^

clean:
	$(RM) *~

realclean: clean
	$(RM) test.xml test.sh
