# distlang apps

This repository contains standalone Distlang example apps.

## Install Distlang

Stable release (Linux/macOS):

```bash
curl -fsSL https://distlang.com/install | bash
```

Latest from `main` for testing (Linux/macOS):

```bash
curl -fsSL https://distlang.com/install-main | bash
```

Windows PowerShell:

```powershell
irm https://distlang.com/install.ps1 | iex
```

Verify install:

```bash
distlang --version
```

## Apps

- `echo/`

## Quick start

```bash
make verify
```

For app testing against the newest `main` build, install with `install-main` first and then run `make verify` or `make run`.
