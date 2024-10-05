FROM node:18-alpine 

WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker's caching mechanism
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Install Angular CLI globally
RUN npm install -g @angular/cli

ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose port 8080
EXPOSE 8080

# Run the Angular app
CMD ["ng", "serve", "--host", "0.0.0.0"]
