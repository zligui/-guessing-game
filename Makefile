# Generate the project README from this Makefile.
.PHONY: all clean FORCE

all: README.md

README.md: guessinggame.sh FORCE
	@echo "# Guessing Game" > README.md
	@echo "" >> README.md
	@echo "A Bash game that asks the user to guess the number of regular files in the current directory." >> README.md
	@echo "" >> README.md
	@echo "## Build information" >> README.md
	@echo "- Make executed at: $$(date '+%Y-%m-%d %H:%M:%S %Z')" >> README.md
	@echo "- Lines in guessinggame.sh: $$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md
	@echo "" >> README.md
	@echo "## Run the game" >> README.md
	@echo '```bash' >> README.md
	@echo "bash guessinggame.sh" >> README.md
	@echo '```' >> README.md

FORCE:

clean:
	rm -f README.md
