# Use Node.js version 20 as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Build the project
RUN npm nx build nft-bridge

# Expose the port that the application will run on
EXPOSE 3000

# Command to run the application
CMD ["node", "./dist/apps/nft-bridge/main.js"]
