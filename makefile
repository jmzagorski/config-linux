.DEFAULT_GOAL := all

all: zellij

zellij:
	@if [ -z "$(ZELLIJ_VERSION)" ]; then \
		echo "Error: ZELLIJ_VERSION is required to run this command."; \
		exit 1; \
	fi
	wget -qO- https://github.com/zellij-org/zellij/releases/download/v$(ZELLIJ_VERSION)/zellij-x86_64-unknown-linux-musl.tar.gz | tar xvz

# Help target to display available commands
help:
	@echo "Available commands:"
	@echo "  make zellij             - Builds zellij with the ZELLIJ_VERSION"
	@echo "  make help               - Display this help message"

.PHONY: all zellij
