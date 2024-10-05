FROM node:18-alpine 

WORKDIR /usr/src/app

# Copy the rest of the application files
COPY . .

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose port 8080
EXPOSE 8080

# Run the Angular app
CMD ["ng", "serve", "--host", "0.0.0.0"]
