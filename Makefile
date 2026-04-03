DISTLANG ?= distlang
APP_DIR := echo

.PHONY: help check-distlang verify build run

help:
	@echo "Targets:"
	@echo "  make check-distlang  - confirm distlang is installed"
	@echo "  make verify          - build the echo app"
	@echo "  make build           - build the echo app"
	@echo "  make run             - run the echo app locally"

check-distlang:
	@command -v $(DISTLANG) >/dev/null 2>&1 || (echo "distlang not found on PATH; install it with 'curl -fsSL https://distlang.com/install | bash'" && exit 1)
	@$(DISTLANG) --help >/dev/null

verify: build

build: check-distlang
	@$(MAKE) -C $(APP_DIR) build DISTLANG=$(DISTLANG)

run: check-distlang
	@$(MAKE) -C $(APP_DIR) run DISTLANG=$(DISTLANG)
