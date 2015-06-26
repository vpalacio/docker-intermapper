# https://index.docker.io/_/centos/
FROM centos

# https://github.com/vpalacio
MAINTAINER Victor Palacio <vpalacio@gmail.com>

# Update the base image.
# RUN yum -y update

# InterMapper Requirements
# Install Compatibility Libraries
RUN yum -y groupinstall "Compatibility Libraries" 

# Install java
RUN yum -y install java-1.7

# Grab InterMapper Server rpm
RUN curl -o /tmp/InterMapper-5.8.2-1.x86_64.5x.rpm http://www.helpsystems.com/download/5726/InterMapper-5.8.2-1.x86_64.5x.rpm/trial?full_name=&product_name=InterMapper+for+64-bit+RedHat

#install InterMapper and any other dependencies
RUN yum -y --nogpgcheck localinstall /tmp/InterMapper-5.8.2-1.x86_64.5x.rpm

# Remove yum metadata.
RUN yum clean all

