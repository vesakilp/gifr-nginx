# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER vesakilp

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

#Run daemon off to prevent die
RUN echo "daemon off;" >> /etc/nginx/nginx.conf