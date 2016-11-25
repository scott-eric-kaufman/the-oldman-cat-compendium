TITLE := TheOldmanCatCompendium

all: clean epub pdf

CONTENT := \
		content/000-meta.yaml \
		content/0*.md \
		content/2*.md

clean:
	rm -f $(TITLE).*

epub:
	pandoc -f markdown -t epub3  \
		--toc \
		--epub-stylesheet content/epub.css \
		-o $(TITLE).epub \
		$(CONTENT)

pdf:
	pandoc -f markdown \
		-V geometry:margin=1.2in \
		--chapters \
		--variable mainfont=Georgia \
		--template content/template.tex \
		--toc \
		-o $(TITLE).pdf \
		$(CONTENT)

tex:
	pandoc -f markdown \
		--chapters \
		--template content/template.tex \
		--toc \
		-o $(TITLE).tex \
		$(CONTENT)

