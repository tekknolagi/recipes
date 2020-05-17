SITEDIR=_site
SOURCES=$(wildcard *.md)
GENERATED=$(patsubst %.md,$(SITEDIR)/%.html, $(SOURCES))

.PHONY: all

all: $(GENERATED)

$(SITEDIR):
	mkdir $(SITEDIR)

$(SITEDIR)/%.html: %.md $(SITEDIR)
	pandoc --standalone --toc --toc-depth 2 -f markdown_github -t html -s $< -o $@
