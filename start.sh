#!/bin/bash
set -e
set -o pipefail

su ${usuario} -p -c "/usr/share/code/code . --extensions-dir /var/vscode-ext"