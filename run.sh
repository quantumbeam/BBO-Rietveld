#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker run --rm -v ${SCRIPT_DIR}/bbo_rietveld:/bbo_rietveld -p 8888:8888 -it bbo-rietveld
