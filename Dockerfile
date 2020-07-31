FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Run as Root user
USER root

# Install Dependencies 
RUN apt update -y
RUN apt install -y novnc x11vnc xvfb net-tools websockify

RUN apt-get install -y --no-install-recommends openbox midori

ADD startup.sh ./startup.sh
RUN chmod 755 /startup.sh

EXPOSE 6080

CMD "/startup.sh"