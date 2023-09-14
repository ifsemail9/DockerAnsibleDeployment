FROM ubuntu

#Install SSH Server
RUN apt update && apt install  net-tools iputils-ping  iproute2 openssh-server sudo -y

# Set password to ROOT User
RUN echo 'root:Docker!' | chpasswd

#Start SSH Server
RUN service ssh start

EXPOSE 22

CMD ["/usr/lib/systemd/systemd"]
