#!/bin/bash
# Helper script to easily regenerate docpad - docpad sometimes
# doesn't regenerate files on update properly.  While ugly, the
# easy solution is to simply manually kick off a docpad generate 
# after CI has pulled in new files.
source ~/.nvm/nvm.sh
cd /app
docpad generate
