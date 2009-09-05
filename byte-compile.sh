#!/bin/sh

emacs -batch -l ~/.emacs -f batch-byte-compile $@
