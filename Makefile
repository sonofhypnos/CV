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

# Pattern rule for PDFs
%/resume.pdf: main.tex
	echo "\def\$(shell echo $(notdir $(dir $@)) | sed 's/.*/\u&/')Version{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

# Targets for each version
skills: $(SKILLS_DIR)/resume.pdf
ea: $(EA_DIR)/resume.pdf
image: $(IMAGE_DIR)/resume.pdf
australia: $(AU_DIR)/resume.pdf

all: skills ea image australia

clean:
	rm -f *.aux *.log *.out flag.tex
	rm -rf $(DIRS)

.PHONY: all skills ea image australia clean
