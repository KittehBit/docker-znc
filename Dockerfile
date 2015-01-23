# Dockerfile version 1.0
# CentOS 7
# ZNC 1.4

FROM centos:7

MAINTAINER KittehBit

RUN useradd -m -s /bin/bash znc

RUN	yum -y install epel-release && \
	yum -y install znc

COPY .znc/ /home/znc/.znc/
RUN chown -R znc.znc /home/znc/

USER znc
EXPOSE 6667 6697 7070
ENTRYPOINT ["znc"]
CMD ["--foreground"]

# Usage:
#
# To create config files:
# docker run -it --name deleteme kittehbit/znc --makeconf
#
# To copy them to the host:
# docker cp deleteme:/home/znc/.znc/ /path/to/Dockerfile/
# That copies the .znc folder in the same directory as the Dockerfile
#
# To run the configured container:
# docker run -d -p 6667:6667 -p 6697:6697 -p 7070:7070 kittehbit/znc
