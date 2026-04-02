DISTLANG ?= distlang

.PHONY: help check-distlang deps cloudflare-init run debug build cloudflare-deps dev deploy

help:
	@echo "Targets:"
	@echo "  make build          - build the v8 backend"
	@echo "  make run            - run the local v8 runtime"
	@echo "  make cloudflare-init - create local Cloudflare target scaffolding"
	@echo "  make cloudflare-deps - install/check wrangler via Makefile.Cloudflare"
	@echo "  make dev            - run wrangler dev via Makefile.Cloudflare"
	@echo "  make deploy         - route deploy via Makefile.Cloudflare"

check-distlang:
	@command -v $(DISTLANG) >/dev/null 2>&1 || (echo "distlang not found on PATH; install it with 'curl -fsSL https://distlang.com/install | bash'" && exit 1)

deps:
	@if command -v workerd >/dev/null 2>&1; then \
		echo "workerd already installed"; \
	else \
		command -v npm >/dev/null 2>&1 || (echo "npm not installed; required to install workerd" && exit 1); \
		npm install -g workerd; \
	fi

cloudflare-init: check-distlang
	@$(MAKE) -f Makefile.Cloudflare init DISTLANG=$(DISTLANG)

run: check-distlang deps
	$(DISTLANG) run index.js --v8-port=5656

debug: check-distlang
	$(DISTLANG) debug build index.js --passes=parse

build: check-distlang
	$(DISTLANG) build index.js

cloudflare-deps: build
	@$(MAKE) -f Makefile.Cloudflare deps DISTLANG=$(DISTLANG)

dev: build
	@$(MAKE) -f Makefile.Cloudflare dev DISTLANG=$(DISTLANG)

deploy: build
	@$(MAKE) -f Makefile.Cloudflare deploy DISTLANG=$(DISTLANG)
