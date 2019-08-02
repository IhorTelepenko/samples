From ubuntu:18.04
RUN 'echo deb http://nginx.org/packages/ubuntu/ bionic nginx>>/etc/apt/sources.list'
RUN 'echo deb-src http://nginx.org/packages/ubuntu/ bionic nginx>>/etc/apt/sources.list'
RUN  apt-get update && apt-get install -y nginx
EXPOSE 80
