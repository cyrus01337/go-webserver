#!/usr/bin/env bash
scripts/build.sh && \
    clear && \
    docker run -p 127.0.0.1:3000:3000 $(basename $PWD)
