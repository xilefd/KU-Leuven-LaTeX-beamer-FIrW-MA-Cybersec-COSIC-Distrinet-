BUILDDIR = build
# Target *.tex file without the extension
TARGET := beamer

TARGET_FILES = $(wildcard *.tex) \
               $(wildcard *.sty) \
			   $(wildcard res/*.png) \
			   $(wildcard res/*.jpg) \
			   $(wildcard res/*.pdf)

$(TARGET).pdf: $(TARGET_FILES)
	@mkdir -p $(BUILDDIR)
	@echo '\def\\builddir{$(BUILDDIR)}' >builddir.def
	pdflatex -interaction nonstopmode -shell-escape -output-directory $(BUILDDIR) $(TARGET).tex
	pdflatex -shell-escape -output-directory $(BUILDDIR) $(TARGET).tex
	@mv $(BUILDDIR)/$(TARGET).pdf .

.PHONY: clean
clean:
	@rm -rf $(BUILDDIR)
	@rm -rf builddir.def
.PHONY: clean-all
clean-all: clean
	@rm -f $(TARGET).pdf
