##################################
# Dockerfile to run Ansible Controller Node - TEST Environment
# Based on an centos Image
############################################################

# Set the base image to use to Ubuntu
FROM centos:7

MAINTAINER Aruna Dharmathilaka 

#Local directory with installation files
ENV DOCKYARD_INSTALLERS=installers

# install packages 
RUN yum update -y
RUN yum install vim -y
RUN yum install python34 python34-devel make unzip  openssh-server openssh-clients wget freetds dos2unix -y
RUN yum install centos-release-ansible-29.noarch -y
RUN yum install ansible -y
RUN yum install net-tools -y
RUN yum install sudo -y


# configure vimrc file
RUN touch ~/.vimrc
RUN echo -e "set ai\nset expandtab\nset tabstop=2" >> ~/.vimrc

# setup ansible configuration environment
WORKDIR /etc/ansible/


# configure ssh and enable 22 port
RUN ssh-keygen -q -f /etc/ssh/ssh_host_rsa_key -N ''

# setup ssh private and public keys
RUN mkdir ~/.ssh
COPY files/id_rsa /root/.ssh/id_rsa
COPY files/id_rsa.pub /root/.ssh/id_rsa.pub
COPY files/known_hosts /root/.ssh/known_hosts
RUN  chmod 700 /root/.ssh/id_rsa && chmod 755 /root/.ssh/id_rsa.pub && chmod 755 /root/.ssh/known_hosts

#copy hosts file 
#RUN rm -f /etc/hosts
COPY files/hosts /etc/ansible/hosts


# Create Admin user
RUN useradd admin
RUN usermod -aG wheel admin



COPY files/entrypoint.sh .
RUN chmod u+x,g+x  ./entrypoint.sh
RUN dos2unix ./entrypoint.sh
# Start SSHD open server
ENTRYPOINT ["/etc/ansible/entrypoint.sh"]
