##
# CV
#
# @file
# @version 0.1

all: skills ea

skills:
	echo "\def\SkillVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf resume.pdf & xdg-open resume_skills.pdf
ea:
	echo "\def\EAVersion{}" > flag.tex
	pdflatex -interaction=nonstopmode main.tex
	mv main.pdf resume_ea_voluntering.pdf & xdg-open resume_ea_volunteering.pdf

clean:
	rm -f *.aux *.log *.out flag.tex

# end
