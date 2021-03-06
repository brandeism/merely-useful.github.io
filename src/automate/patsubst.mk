.PHONY: all clean settings

COUNT=bin/countwords.py
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,${DATA})

# Regenerate all results.
all : ${RESULTS}

# Regenerate result for any book.
results/%.csv : data/%.txt ${COUNT}
	python ${COUNT} $< > $@

# Remove all generated files.
clean :
	rm -f results/*.csv

# Show variables' values.
settings :
	@echo COUNT: ${COUNT}
	@echo DATA: ${DATA}
	@echo RESULTS: ${RESULTS}
