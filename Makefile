DISTLANG ?= distlang
APP_DIR := echo

.PHONY: help check-distlang verify build run dev cloudflare-init

help:
	@echo "Targets:"
	@echo "  make check-distlang  - confirm distlang is installed"
	@echo "  make verify          - build the echo app"
	@echo "  make build           - build the echo app"
	@echo "  make run             - run the echo app locally"
	@echo "  make cloudflare-init - scaffold Cloudflare target files for echo"
	@echo "  make dev             - run wrangler dev for echo"

check-distlang:
	@command -v $(DISTLANG) >/dev/null 2>&1 || (echo "distlang not found on PATH; install it with 'curl -fsSL https://distlang.com/install | bash'" && exit 1)
	@$(DISTLANG) --help >/dev/null

verify: build

build: check-distlang
	@$(MAKE) -C $(APP_DIR) build DISTLANG=$(DISTLANG)

run: check-distlang
	@$(MAKE) -C $(APP_DIR) run DISTLANG=$(DISTLANG)

cloudflare-init: check-distlang
	@$(MAKE) -C $(APP_DIR) cloudflare-init DISTLANG=$(DISTLANG)

dev: check-distlang
	@$(MAKE) -C $(APP_DIR) dev DISTLANG=$(DISTLANG)
