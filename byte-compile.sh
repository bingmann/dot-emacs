#!/bin/sh

exec emacs -batch -L ~/.emacs.d/ -f batch-byte-compile $@
