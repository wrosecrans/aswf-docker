#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR" || exit 1
find . -type f -executable -iname \*.sh\* -exec shellcheck -Calways {} \;
