FROM centos:7
MAINTAINER Gary Gogick <gary@aug.io>
ENV NODE_ENV docker
ENV NODE_VER v0.12.3
# Update and install prerequisites
RUN yum -y update; yum -y install epel-release; yum -y install gcc-c++ make tar bzip2 supervisor; yum -y clean all
# Install nvm, our chosen node version and grunt-cli
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.2/install.sh | bash
RUN /bin/bash -c "source ~/.nvm/nvm.sh; nvm install $NODE_VER && nvm alias default $NODE_VER && nvm use default"
# Install docpad
RUN /bin/bash -c "source ~/.nvm/nvm.sh; npm install -g docpad"
RUN printf "subscribed: false\nsubscribeTryAgain: null\ntos: true\nidentified: true\n" > ~/.docpad.cson
# Set up supervisord config
ADD supervisord.conf /etc/supervisord.conf
# Set up the application directory
VOLUME ["/app"]
WORKDIR /app
ADD start.sh /
ADD generate.sh /
# Expose the default port
EXPOSE 9778
# Launch, passing arguments
CMD ["-"]
ENTRYPOINT ["/start.sh"]

