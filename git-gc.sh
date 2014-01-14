#!/bin/bash

find . -name .git -type d -exec bash -c "pushd {} && git gc --aggressive && git prune && popd" \;
