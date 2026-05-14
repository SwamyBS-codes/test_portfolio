# Use lightweight nginx
FROM nginx:stable-alpine

LABEL maintainer="your-name"

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run nginx
CMD ["nginx", "-g", "daemon off;"]