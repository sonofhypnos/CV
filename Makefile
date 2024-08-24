##
# CV
#
# @file
# @version 0.2

# Directories
SKILLS_DIR := skills
EA_DIR := ea
IMAGE_DIR := image

# Ensure directories exist
$(shell mkdir -p $(SKILLS_DIR) $(EA_DIR) $(IMAGE_DIR))

all: skills ea image

skills:
	echo "\def\SkillVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $(SKILLS_DIR)/resume.pdf && xdg-open $(SKILLS_DIR)/resume.pdf

ea:
	echo "\def\EAVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $(EA_DIR)/resume.pdf && xdg-open $(EA_DIR)/resume.pdf

image:
	echo "\def\ImageVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf $(IMAGE_DIR)/resume.pdf && xdg-open $(IMAGE_DIR)/resume.pdf

clean:
	rm -f *.aux *.log *.out flag.tex
	rm -rf $(SKILLS_DIR) $(EA_DIR) $(IMAGE_DIR)

.PHONY: all skills ea image clean
