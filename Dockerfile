# Use the official Node image as the base image.
FROM node:14

# Set the working directory.
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory.
COPY package.json ./
COPY package-lock.json ./

# Install the dependencies.
RUN npm install

# Copy the rest of the application code to the working directory.
COPY . .

# Build the React app.
RUN npm run build

# Install an HTTP server to serve the React app.
RUN npm install -g serve

# Set the command to run the HTTP server on port 3000.
CMD ["serve", "-s", "build", "-l", "3000"]

# Expose port 3000 to the outside world.
EXPOSE 3000
