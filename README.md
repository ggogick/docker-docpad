# docker-docpad
A Docker container for DocPad

Available on [Docker Hub](https://registry.hub.docker.com/u/ggogick/docpad/).

This Dockerfile builds an image with node.js (via nvm), supervisord, docpad, and a supporting start script to handle npm install/rebuild.  The image expects a directory containing a docpad site to be mounted to /app.

This is mainly for personal use and was thrown together quickly.  Improvements will likely be made; guarantees will not.

### Instructions for use:

1. docker pull ggogick/docpad
2. docker run -d -p 9778:9778 -v /PATH/TO/YOUR/DOCPAD/SITE:/app:rw docpad
