FROM node:latest

MAINTAINER Masood Ahmed "masood.ahmed@galepartners.com"

EXPOSE 3000

ENV HOME /root
ENV APP_HOME /application/
ENV NODE_ENV production

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN git clone https://github.com/prerender/prerender.git /application
WORKDIR $APP_HOME

RUN npm install

CMD ["node", "server.js"]
