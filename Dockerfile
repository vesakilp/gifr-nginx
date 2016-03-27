# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER vesakilp

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf