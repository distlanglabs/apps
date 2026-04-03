# echo

This app shows a standalone Distlang app using:

- `state.dbs.ObjectDB`
- `state.observability.AppMetrics`
- `compute.handlers`

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

## Run locally

```bash
make run
```

The local runtime listens on `http://127.0.0.1:5656`.

If you are testing the newest Distlang changes, use `install-main` before running this example.

## Build

```bash
make build
```

`make build` generates local output in `dist/` and `generated/`.

## Clean

```bash
make clean
```

## Routes

- `POST /echo/config`
- `GET /echo/:text`
