#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker run --rm -v ${SCRIPT_DIR}/:/workspace -p 8888:8888 -it resnant/bbo-rietveld:v1.1 jupyter lab --allow-root --ip 0.0.0.0
