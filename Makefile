.DEFAULT_GOAL := all
.PHONY: zellij install-vim

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: install-vim ## install/build all current tooling

zellij: ## Install zellij (tmux alternative)
	@if [ -z "$(ZELLIJ_VERSION)" ]; then \
		echo "Error: ZELLIJ_VERSION is required to run this command."; \
		exit 1; \
	fi
	wget -qO- https://github.com/zellij-org/zellij/releases/download/v$(ZELLIJ_VERSION)/zellij-x86_64-unknown-linux-musl.tar.gz | tar xvz

vim: ## Install the latest vim version
	sudo apt update
	sudo apt install -y git build-essential libncurses-dev
	git clone https://github.com/vim/vim.git /tmp/vim
	cd /tmp/vim/src && ./configure --with-features=huge
	cd /tmp/vim/src && make
	cd /tmp/vim/src && sudo make install
	rm -rf /tmp/vim
	sudo apt-get autoremove -y
	sudo apt-get clean
