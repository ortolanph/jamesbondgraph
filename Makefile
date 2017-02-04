SVG_FORMAT=svg
PNG_FORMAT=png

.PHONY: clear

clear_svg:
	./lib/clean.sh $(SVG_FORMAT)

clear_png:
	./lib/clean.sh $(PNG_FORMAT)

clear: clear_png clear_svg

compile_svg: clear_svg
	./lib/compile.sh $(SVG_FORMAT)

compile_png: clear_png
	./lib/compile.sh $(PNG_FORMAT)

compile: compile_png compile_svg
