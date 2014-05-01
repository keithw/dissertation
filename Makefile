.PHONY: FORCE
main.pdf: FORCE
	./latexrun main

.PHONY: clean
clean:
	./latexrun --clean-all
