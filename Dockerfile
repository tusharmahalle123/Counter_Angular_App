# Use the official Node.js Alpine image
FROM node:18-alpine

# Install Chromium
RUN apk add --no-cache chromium

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first for efficient caching
COPY package*.json .

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Create a non-root user and switch to it
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Set environment variable for OpenSSL
ENV NODE_OPTIONS=--openssl-legacy-provider

# Set Chrome as the default browser for Karma
ENV CHROME_BIN=/usr/bin/chromium-browser

# Expose port 8080
EXPOSE 8080

# Default command to run when starting the container
CMD ["ng", "serve", "--host", "0.0.0.0"]
