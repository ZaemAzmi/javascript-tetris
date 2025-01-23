# Use nginx as base image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy project files to working directory
COPY . .

# Set permissions
RUN chmod -R 755 /usr/share/nginx/html

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget --quiet --tries=1 --spider http://localhost:80 || exit 1

# Expose port 80 (default for HTTP)
EXPOSE 80

# Command to run nginx
CMD ["nginx", "-g", "daemon off;"]