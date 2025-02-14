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

# Ensure directories exist
$(shell mkdir -p $(SKILLS_DIR) $(EA_DIR) $(IMAGE_DIR) $(AU_DIR))

# Pattern rules for each version
$(SKILLS_DIR)/resume.pdf: main.tex
	echo "\def\SkillsVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

$(EA_DIR)/resume.pdf: main.tex
	echo "\def\EAVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

$(IMAGE_DIR)/resume.pdf: main.tex
	echo "\def\ImageVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

$(AU_DIR)/resume.pdf: main.tex
	echo "\def\AustraliaVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $@ && xdg-open $@

skills: $(SKILLS_DIR)/resume.pdf
ea: $(EA_DIR)/resume.pdf
image: $(IMAGE_DIR)/resume.pdf
australia: $(AU_DIR)/resume.pdf

all: skills ea image australia

clean:
	rm -f *.aux *.log *.out flag.tex
	rm -rf $(SKILLS_DIR) $(EA_DIR) $(IMAGE_DIR) $(AU_DIR)

.PHONY: all skills ea image australia clean
