##
# CV
#
# @author Tassilo Neubauer
# @file
# @version 0.3

# Directories
SKILLS_DIR := skills
EA_DIR := ea
IMAGE_DIR := image
AU_DIR := australia

VERSIONS := skills ea image australia
DIRS := $(SKILLS_DIR) $(EA_DIR) $(IMAGE_DIR) $(AU_DIR)

# Ensure directories exist
$(shell mkdir -p $(DIRS))

# Generic rule for all versions
$(DIRS)/%: main.tex
	echo "\def\$(shell echo $(notdir $(dir $@)) | sed 's/.*/\u&/')Version{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

# Targets for each version
$(VERSIONS): %: $(dir $(DIRS))%/resume.pdf

all: $(VERSIONS)

clean:
	rm -f *.aux *.log *.out flag.tex
	rm -rf $(DIRS)

.PHONY: all $(VERSIONS) clean
