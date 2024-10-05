# Use the official Node.js Alpine image
FROM node:18-alpine

# Install Chromium for headless browser tests
RUN apk add --no-cache chromium nss freetype harfbuzz \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

# Set CHROME_BIN and add --no-sandbox to avoid permission errors
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

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

# Set environment variable for OpenSSL
ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose port 8080
EXPOSE 8080

# Default command to run when starting the container
CMD ["ng", "serve", "--host", "0.0.0.0"]
