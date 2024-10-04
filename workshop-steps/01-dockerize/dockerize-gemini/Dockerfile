
# Gemini did this:
    # Build with `docker build -t phpapp-gemini .`

FROM php:7.4-apache

# Install the MySQL extension
RUN docker-php-ext-install mysqli

# Create a directory for your application code
WORKDIR /var/www/html

# Copy the application code into the container
COPY app/ /var/www/html

# Expose port 80 for web traffic
EXPOSE 80
