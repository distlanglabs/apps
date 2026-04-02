# echo

This app shows a standalone Distlang app using:

- `state.dbs.ObjectDB`
- `state.observability.AppMetrics`
- `compute.handlers`

## Install Distlang

Linux/macOS:

```bash
curl -fsSL https://distlang.com/install | bash
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

## Routes

- `POST /echo/config`
- `GET /echo/:text`

## Build

```bash
make build
```
