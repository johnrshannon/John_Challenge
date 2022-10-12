# Container image that runs your code
FROM nginx

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY www /usr/share/nginx/html
COPY conf /etc/nginx/conf.d/
COPY certfiles /etc/nginx/conf.d
