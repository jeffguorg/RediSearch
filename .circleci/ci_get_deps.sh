#!/bin/bash

set -x

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ROOT=$(cd $HERE/..; pwd)
cd $ROOT

git submodule update --init --recursive
./deps/readies/bin/getpy2
./deps/readies/bin/getpy3
./system-setup.py
python2 ./tests/pytests/test_rdb_compatibility.py
