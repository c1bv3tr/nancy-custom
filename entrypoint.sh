#!/bin/sh -l
/install-nancy.sh $INPUT_NANCYVERSION

nancy $2 < $1  > /github/workspace/nancy.json  || true
