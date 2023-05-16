#!/bin/sh

set -e

mkdir .venv
python -m venv .venv
source .venv/bin/activate
python -m pip install "python-lsp-server[all]" pylsp-mypy
if [[ -e requirements.txt ]]; then
    python -m pip install -r requirements.txt
fi
