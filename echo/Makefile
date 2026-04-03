DISTLANG ?= distlang

.PHONY: help check-distlang deps build run clean

help:
	@echo "Targets:"
	@echo "  make build  - compile index.js into local dist/ output"
	@echo "  make run    - build and run the app locally on port 5656"
	@echo "  make clean  - remove local build output"

check-distlang:
	@command -v $(DISTLANG) >/dev/null 2>&1 || (echo "distlang not found on PATH; install it with 'curl -fsSL https://distlang.com/install | bash' or 'curl -fsSL https://distlang.com/install-main | bash'" && exit 1)

deps:
	@if command -v workerd >/dev/null 2>&1; then \
		echo "workerd already installed"; \
	else \
		command -v npm >/dev/null 2>&1 || (echo "npm not installed; required to install workerd" && exit 1); \
		npm install -g workerd; \
	fi

build: check-distlang
	$(DISTLANG) build index.js

run: check-distlang deps
	$(DISTLANG) run index.js --v8-port=5656

clean:
	rm -rf dist generated
