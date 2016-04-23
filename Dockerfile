# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER vesakilp

# Install Nginx

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

# Copy certificate files
ADD PUBLIC.pem /etc/nginx/ssl/
ADD PRIVATE.key /etc/nginx/ssl/

# Append "daemon off;" to the configuration file
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 8443

# Set the default command to execute when creating a new container
CMD service nginx start
