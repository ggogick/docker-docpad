#!/bin/bash
# Using both install and rebuild.  Install, in case this is a 
# completely fresh installation.  Rebuild, in the event node 
# versions/etc. have changed.  This is not perfect, but is
# kind of mostly okay.
source ~/.nvm/nvm.sh
cd /app
npm install
npm rebuild
supervisord -n -c /etc/supervisord.conf
