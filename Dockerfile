# Use Node.js alpine image for a lightweight setup
FROM node:18-alpine 

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for better caching
COPY package*.json ./ 

# Install necessary packages including Chrome
RUN apk add --no-cache \
    curl \
    chromium \
    && npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the rest of the application files
COPY . . 

# Set environment variable to avoid OpenSSL issues
ENV NODE_OPTIONS=--openssl-legacy-provider 

# Set environment variable for Chrome
ENV CHROME_BIN=/usr/bin/chromium-browser

# Expose port 8080
EXPOSE 8080 

# Command to run the Angular app
CMD ["ng", "serve", "--host", "0.0.0.0"]
