#!/bin/bash

set -e
cd "$(dirname "$0")/.."
release_filename=CDi_$(date '+%Y%m%d').rbf
scp output_files/CDi.rbf root@mister:/media/fat/$release_filename
echo "Created /media/fat/$release_filename on MiSTer !"
