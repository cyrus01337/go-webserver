#!/usr/bin/env bash
docker build --build-arg build_directory=dist/ --tag $(basename $PWD) .
